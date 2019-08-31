package main

import (
	"github.com/gin-gonic/gin"
	"os"
)

func main() {

	response := os.Getenv("MY_RESPONSE")
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": response,
		})
	})
	r.Run()
	
}
