package controller

import (
	"fmt"
	"gs/app/models"
	"gs/app/services"
	"gs/util"
	"net/http"
	"strconv"
	"time"

	"github.com/dgrijalva/jwt-go"
	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
)

// UserLogin 用户登陆
func UserLogin(c *gin.Context) {
	type login struct {
		Username string `json:"username"`
		Password string `json:"password"`
	}
	user := &models.User{}
	data := &login{}
	err := c.BindJSON(data)
	if err != nil {
		c.JSON(http.StatusOK, gin.H{
			"code":    http.StatusBadRequest,
			"message": "缺乏参数",
			"data":    gin.H{},
		})
		return
	}
	userService := services.NewUserService()
	userService.CheckUserPassWord(user, data.Username)
	encryptPassword := util.GetMd5ByString(fmt.Sprintf("%s.%s", data.Password, user.Salt))
	if encryptPassword == user.Password {
		c.JSON(http.StatusOK, gin.H{
			"code":    http.StatusOK,
			"message": "登陆成功",
			"data": gin.H{
				"token": getJWTEncodeString(strconv.Itoa(user.ID)),
			},
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"code":    http.StatusBadRequest,
		"message": "账号或者密码错误",
		"data":    gin.H{},
	})
}

// UserRegister 用户注册
func UserRegister(c *gin.Context) {
	type login struct {
		Username string `json:"username" validate:"required,min=5,max=12"`
		Password string `json:"password" validate:"required"`
	}
	// 注册个验证器
	validator := validator.New()
	//
	data := &login{}
	err := c.BindJSON(data)
	if err != nil {
		c.JSON(http.StatusOK, gin.H{
			"code":    http.StatusBadRequest,
			"message": "缺乏参数",
			"data":    gin.H{},
		})
		return
	}
	err = validator.Struct(data)
	if err != nil {
		c.JSON(http.StatusOK, gin.H{
			"code":    http.StatusBadRequest,
			"message": "参数格式错误",
			"data":    gin.H{},
		})
		return
	}
	// 随机生成加密数
	salt := util.GetRandomString(10)
	// 加密之后的密码
	encryptPassword := util.GetMd5ByString(fmt.Sprintf("%s.%s", data.Password, salt))
	userService := services.NewUserService()
	// 添加用户
	userID, err := userService.AddUser(&models.User{
		Username: data.Username,
		Password: encryptPassword,
		Salt:     salt,
	})
	if err != nil {
		c.JSON(http.StatusOK, gin.H{
			"code":    http.StatusBadRequest,
			"message": "添加失败！",
		})
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"code":    http.StatusOK,
		"message": "添加成功！",
		"data": gin.H{
			"token": getJWTEncodeString(strconv.Itoa(userID)),
		},
	})
}

// GetJWTEncodeString 获取用户jwt
func getJWTEncodeString(userId string) string {
	// 获取当前时间
	timer := time.Now()
	// 获取一个月后的过期时间
	mouthTime, _ := time.ParseDuration("720h")
	// 获取时间戳
	expUnix := timer.Add(mouthTime).Unix()
	// 密钥
	mySigningKey := []byte("AllYourBase")
	type CustomClaims struct {
		jwt.StandardClaims
	}
	// 创建Cliaims
	claims := CustomClaims{
		jwt.StandardClaims{
			ExpiresAt: expUnix,
			NotBefore: timer.Unix(),
			IssuedAt:  timer.Unix(),
			Subject:   "custom",
			Audience:  userId,
		},
	}
	// 创建token
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	// 创建token字符串
	tokenString, _ := token.SignedString(mySigningKey)
	return tokenString
}
