package routers

import (
	"github.com/gorilla/mux"
)

// InitRoutes - config the routers
func InitRoutes() *mux.Router {
	router := mux.NewRouter()
	router = SetFinancialTransationsRoutes(router)
	router = SetLastPurchasesRoutes(router)
	return router
}
