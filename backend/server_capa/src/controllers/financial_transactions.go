package controllers

import (
	"encoding/json"
	"net/http"

	. "github.com/dalmarcogd/challenge_ms/backend/server_capa/src/config"
	. "github.com/dalmarcogd/challenge_ms/backend/server_capa/src/dao"
	. "github.com/dalmarcogd/challenge_ms/backend/server_capa/src/models"
	"github.com/gorilla/mux"
	"gopkg.in/mgo.v2/bson"
)

var daoFinancialTransactions = FinancialTransactionsDAO{}

// AllFinancialTransactionsEndPoint - List all data financial transactions
func AllFinancialTransactionsEndPoint(w http.ResponseWriter, r *http.Request, next http.HandlerFunc) {
	financialTransactions, err := daoFinancialTransactions.FindAll()
	if err != nil {
		respondWithError(w, http.StatusInternalServerError, err.Error())
		return
	}
	respondWithJSON(w, http.StatusOK, financialTransactions)
}

// FindFinancialTransactionsEndpoint - List all data financial transactions by cpf
func FindFinancialTransactionsEndpoint(w http.ResponseWriter, r *http.Request, next http.HandlerFunc) {
	params := mux.Vars(r)
	financialTransaction, err := daoFinancialTransactions.FindByID(params["id"])
	if err != nil {
		respondWithError(w, http.StatusBadRequest, "Invalid FinancialTransaction ID")
		return
	}
	respondWithJSON(w, http.StatusOK, financialTransaction)
}

// CreateFinancialTransactionsEndPoint a new financialTransaction
func CreateFinancialTransactionsEndPoint(w http.ResponseWriter, r *http.Request, next http.HandlerFunc) {
	defer r.Body.Close()
	var financialTransaction FinancialTransaction
	if err := json.NewDecoder(r.Body).Decode(&financialTransaction); err != nil {
		respondWithError(w, http.StatusBadRequest, "Invalid request payload")
		return
	}

	financialTransaction.ID = bson.NewObjectId()
	if err := daoFinancialTransactions.Insert(financialTransaction); err != nil {
		respondWithError(w, http.StatusInternalServerError, err.Error())
		return
	}
	respondWithJSON(w, http.StatusCreated, financialTransaction)
}

// UpdateFinancialTransactionsEndPoint update an existing financialTransaction
func UpdateFinancialTransactionsEndPoint(w http.ResponseWriter, r *http.Request, next http.HandlerFunc) {
	defer r.Body.Close()
	var financialTransaction FinancialTransaction
	if err := json.NewDecoder(r.Body).Decode(&financialTransaction); err != nil {
		respondWithError(w, http.StatusBadRequest, "Invalid request payload")
		return
	}
	if err := daoFinancialTransactions.Update(financialTransaction); err != nil {
		respondWithError(w, http.StatusInternalServerError, err.Error())
		return
	}
	respondWithJSON(w, http.StatusOK, map[string]string{"result": "success"})
}

// DeleteFinancialTransactionsEndPoint an existing financialTransaction
func DeleteFinancialTransactionsEndPoint(w http.ResponseWriter, r *http.Request, next http.HandlerFunc) {
	defer r.Body.Close()
	var movie FinancialTransaction
	if err := json.NewDecoder(r.Body).Decode(&movie); err != nil {
		respondWithError(w, http.StatusBadRequest, "Invalid request payload")
		return
	}
	if err := daoFinancialTransactions.Delete(movie); err != nil {
		respondWithError(w, http.StatusInternalServerError, err.Error())
		return
	}
	respondWithJSON(w, http.StatusOK, map[string]string{"result": "success"})
}

func init() {
	config.Read()

	daoFinancialTransactions.Server = config.Server
	daoFinancialTransactions.Database = config.Database
	daoFinancialTransactions.Connect()
}
