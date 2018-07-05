package main

import (
	"fmt"
	"log"
	"net/http"

	. "github.com/dalmarcogd/challenge_ms-restapi/backend/server_capa/src/dao"
	. "github.com/dalmarcogd/challenge_ms-restapi/backend/server_capa/src/models"
	"github.com/gorilla/mux"
)

// AllFinancialTransactionsEndPoint - List all data financial transactions
func AllFinancialTransactionsEndPoint(w http.ResponseWriter, r *http.Request) {
	financialTransactions, err := dao.FindAll()
	if err != nil {
		respondWithError(w, http.StatusInternalServerError, err.Error())
		return
	}
	respondWithJson(w, http.StatusOK, financialTransactions)
}

// FindFinancialTransactionsEndpoint - List all data financial transactions by cpf
func FindFinancialTransactionsEndpoint(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "not implemented yet !")
}

func main() {
	r := mux.NewRouter()
	r.HandleFunc("/financial-transactions", AllFinancialTransactionsEndPoint).Methods("GET")
	r.HandleFunc("/financial-transactions/{cpf}", FindFinancialTransactionsEndpoint).Methods("GET")
	if err := http.ListenAndServe(":3000", r); err != nil {
		log.Fatal(err)
	}
}
