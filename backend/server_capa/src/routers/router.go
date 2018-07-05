package routers

import (
	"github.com/gorilla/mux"
)

func InitRoutes() *mux.Router {
	router := mux.NewRouter()
	router = SetFinancialTransationsRoutes(router)
	router = SetAuthenticationRoutes(router)
	return router
}
