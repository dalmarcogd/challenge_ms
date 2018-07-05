package main

import (
	"net/http"

	"github.com/codegangsta/negroni"
	"github.com/dalmarcogd/challenge_ms/backend/server_capa/src/routers"
)

func main() {
	router := routers.InitRoutes()
	n := negroni.Classic()
	n.UseHandler(router)
	http.ListenAndServe(":5000", n)
}
