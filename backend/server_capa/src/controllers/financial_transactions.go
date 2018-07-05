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

var config = Config{}
var dao = FinancialTransactionsDAO{}

// AllFinancialTransactionsEndPoint - List all data financial transactions
func AllFinancialTransactionsEndPoint(w http.ResponseWriter, r *http.Request) {
	financialTransactions, err := dao.FindAll()
	if err != nil {
		respondWithError(w, http.StatusInternalServerError, err.Error())
		return
	}
	respondWithJSON(w, http.StatusOK, financialTransactions)
}

// FindFinancialTransactionsEndpoint - List all data financial transactions by cpf
func FindFinancialTransactionsEndpoint(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)
	movie, err := dao.FindByID(params["id"])
	if err != nil {
		respondWithError(w, http.StatusBadRequest, "Invalid Movie ID")
		return
	}
	respondWithJSON(w, http.StatusOK, movie)
}

// CreateFinancialTransactionsEndPoint a new movie
func CreateFinancialTransactionsEndPoint(w http.ResponseWriter, r *http.Request) {
	defer r.Body.Close()
	var financialTransaction FinancialTransaction
	if err := json.NewDecoder(r.Body).Decode(&financialTransaction); err != nil {
		respondWithError(w, http.StatusBadRequest, "Invalid request payload")
		return
	}
	financialTransaction.ID = bson.NewObjectId()
	if err := dao.Insert(financialTransaction); err != nil {
		respondWithError(w, http.StatusInternalServerError, err.Error())
		return
	}
	respondWithJSON(w, http.StatusCreated, financialTransaction)
}

// UpdateFinancialTransactionsEndPoint update an existing movie
func UpdateFinancialTransactionsEndPoint(w http.ResponseWriter, r *http.Request) {
	defer r.Body.Close()
	var financialTransaction FinancialTransaction
	if err := json.NewDecoder(r.Body).Decode(&financialTransaction); err != nil {
		respondWithError(w, http.StatusBadRequest, "Invalid request payload")
		return
	}
	if err := dao.Update(financialTransaction); err != nil {
		respondWithError(w, http.StatusInternalServerError, err.Error())
		return
	}
	respondWithJSON(w, http.StatusOK, map[string]string{"result": "success"})
}

// DeleteFinancialTransactionsEndPoint an existing movie
func DeleteFinancialTransactionsEndPoint(w http.ResponseWriter, r *http.Request) {
	defer r.Body.Close()
	var movie FinancialTransaction
	if err := json.NewDecoder(r.Body).Decode(&movie); err != nil {
		respondWithError(w, http.StatusBadRequest, "Invalid request payload")
		return
	}
	if err := dao.Delete(movie); err != nil {
		respondWithError(w, http.StatusInternalServerError, err.Error())
		return
	}
	respondWithJSON(w, http.StatusOK, map[string]string{"result": "success"})
}

func respondWithError(w http.ResponseWriter, code int, msg string) {
	respondWithJSON(w, code, map[string]string{"error": msg})
}

func respondWithJSON(w http.ResponseWriter, code int, payload interface{}) {
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
