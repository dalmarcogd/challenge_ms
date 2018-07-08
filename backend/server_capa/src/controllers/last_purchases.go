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
var dao = LastPurchasesDAO{}

// AllLastPurchasesEndPoint - List all data financial transactions
func AllLastPurchasesEndPoint(w http.ResponseWriter, r *http.Request, next http.HandlerFunc) {
	lastPurchases, err := dao.FindAll()
	if err != nil {
		respondWithError(w, http.StatusInternalServerError, err.Error())
		return
	}
	respondWithJSON(w, http.StatusOK, lastPurchases)
}

// FindLastPurchasesEndpoint - List all data financial transactions by cpf
func FindLastPurchasesEndpoint(w http.ResponseWriter, r *http.Request, next http.HandlerFunc) {
	params := mux.Vars(r)
	movie, err := dao.FindByID(params["id"])
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
	if err := dao.Insert(lastPurchase); err != nil {
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
	if err := dao.Update(lastPurchase); err != nil {
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
