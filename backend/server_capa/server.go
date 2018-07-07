package main

import (
	"fmt"
	"net/http"

	"github.com/codegangsta/negroni"
	"github.com/dalmarcogd/challenge_ms/backend/server_capa/src/routers"
)

func main() {
	router := routers.InitRoutes()
	n := negroni.Classic()
	n.UseHandler(router)
	fmt.Println("Listen on http://127.0.0.1:8003")
	http.ListenAndServe(":8003", n)
}
