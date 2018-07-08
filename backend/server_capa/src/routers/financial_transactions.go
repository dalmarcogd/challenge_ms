package routers

import (
	"github.com/codegangsta/negroni"
	"github.com/dalmarcogd/challenge_ms/backend/server_capa/src/controllers"
	"github.com/gorilla/mux"
)

// SetFinancialTransationsRoutes - Register the routes to FinancialTransaction
func SetFinancialTransationsRoutes(router *mux.Router) *mux.Router {

	router.Handle("/financial-transactions",
		negroni.New(
			negroni.HandlerFunc(controllers.AllFinancialTransactionsEndPoint),
		)).Methods("GET").Queries("cpf", "{cpf:[a-zA-Z0-9]*}")

	router.Handle("/financial-transactions/{id}",
		negroni.New(
			negroni.HandlerFunc(controllers.FindFinancialTransactionsEndpoint),
		)).Methods("GET")

	router.Handle("/financial-transactions",
		negroni.New(
			negroni.HandlerFunc(controllers.CreateFinancialTransactionsEndPoint),
		)).Methods("POST")

	router.Handle("/financial-transactions",
		negroni.New(
			negroni.HandlerFunc(controllers.UpdateFinancialTransactionsEndPoint),
		)).Methods("PUT")

	router.Handle("/financial-transactions/{id}",
		negroni.New(
			negroni.HandlerFunc(controllers.DeleteFinancialTransactionsEndPoint),
		)).Methods("DELETE")

	return router
}
