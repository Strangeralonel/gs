package main

import (
	"fmt"
	"gs/global"
	"gs/router"

	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

func init() {
	db, err := gorm.Open("mysql", "root:root@/gs?charset=utf8&parseTime=True&loc=Local")
	if err != nil {
		fmt.Println(err)
	}
	global.DB = db
}

func main() {

	// 初始化路由
	router.RoutesRender()
}
