package router

import (
	"github.com/gin-gonic/gin"
	"gs/app/controller"
	"net/http"
)

// RoutesRender 初始化路由
func RoutesRender() {
	router := gin.Default()
	router.GET("/", func(c *gin.Context) {
		c.String(http.StatusOK, "Hello")
	})

	v1 := router.Group("/v1")
	{
		v1.POST("/login", controller.UserLogin)
		v1.POST("/register", controller.UserRegister)
	}

	router.Use(Cors())
	router.Run(":9000")
}

// Cors 处理跨域
func Cors() gin.HandlerFunc {
	return func(c *gin.Context) {
		method := c.Request.Method

		c.Header("Access-Control-Allow-Origin", "*")
		c.Header("Access-Control-Allow-Headers", "Content-Type,AccessToken,X-CSRF-Token, Authorization, Token")
		c.Header("Access-Control-Allow-Methods", "POST, GET, OPTIONS")
		c.Header("Access-Control-Expose-Headers", "Content-Length, Access-Control-Allow-Origin, Access-Control-Allow-Headers, Content-Type")
		c.Header("Access-Control-Allow-Credentials", "true")

		//放行所有OPTIONS方法
		if method == "OPTIONS" {
			c.AbortWithStatus(http.StatusNoContent)
		}
		// 处理请求
		c.Next()
	}
}
