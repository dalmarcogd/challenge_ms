package controllers

import (
	"encoding/json"
	"fmt"
	"net/http"
	"time"

	. "github.com/dalmarcogd/challenge_ms/backend/server_capa/src/dao"
	. "github.com/dalmarcogd/challenge_ms/backend/server_capa/src/models"
	"github.com/gorilla/mux"
	"gopkg.in/mgo.v2/bson"
)

var daoLastPurchases = LastPurchasesDAO{}

// AllLastPurchasesEndPoint - List all data financial transactions
func AllLastPurchasesEndPoint(w http.ResponseWriter, r *http.Request, next http.HandlerFunc) {
	params := mux.Vars(r)
	lastPurchases, err := daoLastPurchases.FindAll(params)
	if err != nil {
		respondWithError(w, http.StatusInternalServerError, err.Error())
		return
	}

	if val, ok := params["cpf"]; ok {
		var consultedCPF ConsultedCPF
		consultedCPF.Cpf = val
		consultedCPF.Date = time.Now()
		consultedCPF.Description = "Last customer purchase by CPF."
		if err := daoConsultedCPFs.Insert(consultedCPF); err != nil {
			fmt.Println("Error when consulted CPF...")
		} else {
			fmt.Println("Success persisted new cosnulted CPF...")
		}
	}

	respondWithJSON(w, http.StatusOK, lastPurchases)
}

// CreateLastPurchasesEndPoint a new movie
func CreateLastPurchasesEndPoint(w http.ResponseWriter, r *http.Request, next http.HandlerFunc) {
	defer r.Body.Close()
	var lastPurchase LastPurchase
	if err := json.NewDecoder(r.Body).Decode(&lastPurchase); err != nil {
		respondWithError(w, http.StatusBadRequest, "Invalid request payload")
		return
	}
	lastPurchase.ID = bson.NewObjectId()
	if err := daoLastPurchases.Insert(lastPurchase); err != nil {
		respondWithError(w, http.StatusInternalServerError, err.Error())
		return
	}
	respondWithJSON(w, http.StatusCreated, lastPurchase)
}

// UpdateLastPurchasesEndPoint update an existing movie
func UpdateLastPurchasesEndPoint(w http.ResponseWriter, r *http.Request, next http.HandlerFunc) {
	defer r.Body.Close()
	var lastPurchase LastPurchase
	if err := json.NewDecoder(r.Body).Decode(&lastPurchase); err != nil {
		respondWithError(w, http.StatusBadRequest, "Invalid request payload")
		return
	}
	if err := daoLastPurchases.Update(lastPurchase); err != nil {
		respondWithError(w, http.StatusInternalServerError, err.Error())
		return
	}
	respondWithJSON(w, http.StatusOK, map[string]string{"result": "success"})
}

// DeleteLastPurchasesEndPoint an existing movie
func DeleteLastPurchasesEndPoint(w http.ResponseWriter, r *http.Request, next http.HandlerFunc) {
	defer r.Body.Close()
	var lastPurchase LastPurchase
	if err := json.NewDecoder(r.Body).Decode(&lastPurchase); err != nil {
		respondWithError(w, http.StatusBadRequest, "Invalid request payload")
		return
	}
	if err := daoLastPurchases.Delete(lastPurchase); err != nil {
		respondWithError(w, http.StatusInternalServerError, err.Error())
		return
	}
	respondWithJSON(w, http.StatusOK, map[string]string{"result": "success"})
}

func init() {
	config.Read()

	daoLastPurchases.Server = config.Server
	daoLastPurchases.Database = config.Database
	daoLastPurchases.Connect()
}
