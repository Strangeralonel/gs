package models

import "github.com/jinzhu/gorm"

type User struct {
	gorm.Model
	ID       int
	Nickname string
	Username string
	Password string
	Salt     string
}

func (u User) TableName() string {
	return "g_user"
}
