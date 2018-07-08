package controllers

import (
	"encoding/json"
	"net/http"

	. "github.com/dalmarcogd/challenge_ms/backend/server_capa/src/config"
	. "github.com/dalmarcogd/challenge_ms/backend/server_capa/src/dao"
	. "github.com/dalmarcogd/challenge_ms/backend/server_capa/src/models"
)

var config = Config{}

func respondWithError(w http.ResponseWriter, code int, msg string) {
	respondWithJSON(w, code, map[string]string{"error": msg})
}

func respondWithJSON(w http.ResponseWriter, code int, payload interface{}) {
	response, _ := json.Marshal(payload)
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(code)
	w.Write(response)
}
