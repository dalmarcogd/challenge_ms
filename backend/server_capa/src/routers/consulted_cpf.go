package routers

import (
	"github.com/codegangsta/negroni"
	"github.com/dalmarcogd/challenge_ms/backend/server_capa/src/controllers"
	"github.com/gorilla/mux"
)

// SetConsultedCPFRoutes - config endpoints about consulted cpf
func SetConsultedCPFRoutes(router *mux.Router) *mux.Router {

	router.Handle("/consutled-cpf/{cpf}",
		negroni.New(
			negroni.HandlerFunc(controllers.AllConsultedCPFsEndPoint),
		)).Methods("GET")

	return router
}
