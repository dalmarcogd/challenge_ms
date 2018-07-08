package routers

import (
	"github.com/codegangsta/negroni"
	"github.com/dalmarcogd/challenge_ms/backend/server_capa/src/controllers"
	"github.com/gorilla/mux"
)

// SetLastPurchasesRoutes - config endpoints about last customer purchases
func SetLastPurchasesRoutes(router *mux.Router) *mux.Router {

	router.Handle("/last-purchases",
		negroni.New(
			negroni.HandlerFunc(controllers.AllLastPurchasesEndPoint),
		)).Methods("GET").Queries("cpf", "{cpf:[0-9]+}")

	router.Handle("/last-purchases/{id}",
		negroni.New(
			negroni.HandlerFunc(controllers.FindLastPurchasesEndpoint),
		)).Methods("GET")

	return router
}
