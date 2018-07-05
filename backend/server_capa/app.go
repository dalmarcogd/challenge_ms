package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	. "github.com/dalmarcogd/challenge_ms/backend/server_capa/src/config"
	. "github.com/dalmarcogd/challenge_ms/backend/server_capa/src/dao"
	. "github.com/dalmarcogd/challenge_ms/backend/server_capa/src/models"
	"github.com/gorilla/mux"
)

var config = Config{}
var dao = FinancialTransactionsDAO{}

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

func respondWithError(w http.ResponseWriter, code int, msg string) {
	respondWithJson(w, code, map[string]string{"error": msg})
}

func respondWithJson(w http.ResponseWriter, code int, payload interface{}) {
	response, _ := json.Marshal(payload)
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(code)
	w.Write(response)
}

func init() {
	config.Read()

	dao.Server = config.Server
	dao.Database = config.Database
	dao.Connect()
}

func main() {
	r := mux.NewRouter()
	r.HandleFunc("/financial-transactions", AllFinancialTransactionsEndPoint).Methods("GET")
	r.HandleFunc("/financial-transactions/{cpf}", FindFinancialTransactionsEndpoint).Methods("GET")
	if err := http.ListenAndServe(":3000", r); err != nil {
		log.Fatal(err)
	}
}
