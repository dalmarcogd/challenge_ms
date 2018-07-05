package routers

import (
	"github.com/codegangsta/negroni"
	"github.com/dalmarcogd/challenge_ms/backend/server_capa/src/controllers"
	"github.com/dalmarcogd/challenge_ms/backend/server_capa/src/core/authentication"
	"github.com/gorilla/mux"
)

func SetAuthenticationRoutes(router *mux.Router) *mux.Router {
	router.HandleFunc("/token-auth", controllers.Login).Methods("POST")
	router.Handle("/refresh-token-auth", negroni.New(negroni.HandlerFunc(controllers.RefreshToken))).Methods("GET")
	router.Handle("/logout", negroni.New(negroni.HandlerFunc(authentication.RequireTokenAuthentication), negroni.HandlerFunc(controllers.Logout))).Methods("GET")
	return router
}
