package controllers

import (
	"encoding/json"
	"net/http"

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
	respondWithJSON(w, http.StatusOK, lastPurchases)
}

// FindLastPurchasesEndpoint - List all data financial transactions by cpf
func FindLastPurchasesEndpoint(w http.ResponseWriter, r *http.Request, next http.HandlerFunc) {
	params := mux.Vars(r)
	movie, err := daoLastPurchases.FindByID(params["id"])
	if err != nil {
		respondWithError(w, http.StatusBadRequest, "Invalid LastPurchase ID")
		return
	}
	respondWithJSON(w, http.StatusOK, movie)
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
	var movie LastPurchase
	if err := json.NewDecoder(r.Body).Decode(&movie); err != nil {
		respondWithError(w, http.StatusBadRequest, "Invalid request payload")
		return
	}
	if err := daoLastPurchases.Delete(movie); err != nil {
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
