package controllers

import (
	"encoding/json"
	"fmt"
	"net/http"

	. "github.com/dalmarcogd/challenge_ms/backend/server_capa/src/dao"
	. "github.com/dalmarcogd/challenge_ms/backend/server_capa/src/models"
	"github.com/gorilla/mux"
	"gopkg.in/mgo.v2/bson"
)

var daoFinancialTransactions = FinancialTransactionsDAO{}

// AllFinancialTransactionsEndPoint - List all data financial transactions
func AllFinancialTransactionsEndPoint(w http.ResponseWriter, r *http.Request, next http.HandlerFunc) {
	params := mux.Vars(r)
	fmt.Println(params)
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

	if financialTransaction.Type == "Debit" && financialTransaction.PaymentType == "CreditCard" {
		lastPurchases, err := daoLastPurchases.FindByQuery(bson.M{"cpf": financialTransaction.Cpf})
		if err != nil {
			fmt.Println("Not found last customer purchase by cpf: ", financialTransaction.Cpf)
		}

		var lastPurchase LastPurchase
		lastPurchase.ID = bson.NewObjectId()
		var isNew = true
		if len(lastPurchases) > 0 {
			lastPurchase = lastPurchases[:1][0]
			isNew = false
		}

		lastPurchase.Cpf = financialTransaction.Cpf
		lastPurchase.Date = financialTransaction.Date
		lastPurchase.Value = financialTransaction.Value
		lastPurchase.Description = financialTransaction.Description
		lastPurchase.PaymentType = financialTransaction.PaymentType

		if isNew {
			if err := daoLastPurchases.Insert(lastPurchase); err != nil {
				fmt.Println("Error when persist new last customer purchase...")
			} else {
				fmt.Println("Success persisted new last customer purchase...")
			}
		} else {
			if err := daoLastPurchases.Update(lastPurchase); err != nil {
				fmt.Println("Error when update last customer purchase...")
			} else {
				fmt.Println("Success updated last customer purchase...")
			}
		}
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
	var financialTransaction FinancialTransaction
	if err := json.NewDecoder(r.Body).Decode(&financialTransaction); err != nil {
		respondWithError(w, http.StatusBadRequest, "Invalid request payload")
		return
	}
	if err := daoFinancialTransactions.Delete(financialTransaction); err != nil {
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
