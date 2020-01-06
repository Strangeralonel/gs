package services

import (
	"gs/app/models"
	"gs/global"
)

// IUserService 用户服务接口
type IUserService interface {
	AddUser(*models.User) (int, error)
	CheckUserExist(string) bool
	CheckUserPassWord(*models.User, string) error
}

// UserService 用户服务结构体
type UserService struct {
}

// NewUserService 实例一个用户服务
func NewUserService() IUserService {
	return &UserService{}
}

// CheckUser 检查该用户是否存在
func (u *UserService) CheckUserExist(username string) (hasUser bool) {
	hasUser = false
	return hasUser
}

// AddUser 添加用户
func (u *UserService) AddUser(user *models.User) (int, error) {
	db := global.DB.Create(user)
	return user.ID, db.Error
}

func (u *UserService) CheckUserPassWord(user *models.User, username string) error {
	global.DB.Where("username = ?", username).Find(user)
	return nil
}
