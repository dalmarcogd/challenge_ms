package controllers

import (
	"net/http"

	. "github.com/dalmarcogd/challenge_ms/backend/server_capa/src/dao"
	. "github.com/dalmarcogd/challenge_ms/backend/server_capa/src/models"
	"github.com/gorilla/mux"
)

var daoConsultedCPFs = ConsultedCPFDAO{}

// AllConsultedCPFsEndPoint - List all data consulted cpf
func AllConsultedCPFsEndPoint(w http.ResponseWriter, r *http.Request, next http.HandlerFunc) {
	params := mux.Vars(r)
	consultedCPFs, err := daoConsultedCPFs.FindAll(params)
	if err != nil {
		respondWithError(w, http.StatusInternalServerError, err.Error())
		return
	}
	respondWithJSON(w, http.StatusOK, consultedCPFs)
}

func init() {
	config.Read()

	daoConsultedCPFs.Server = config.Server
	daoConsultedCPFs.Database = config.Database
	daoConsultedCPFs.Connect()
}
