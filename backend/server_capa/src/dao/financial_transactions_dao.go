package dao

import (
	"log"
	"github.com/dalmarcogd/challenge_ms/models"


	mgo "gopkg.in/mgo.v2"
	"gopkg.in/mgo.v2/bson"
)

// FinancialTransactionsDAO - Dao that resposible to keep the FinancialTransaction
type FinancialTransactionsDAO struct {
	Server   string
	Database string
}

var db *mgo.Database

const (
	// COLLECTION - the name of collection
	COLLECTION = "financial_transactions"
)

// Connect - Conection with db server
func (m *FinancialTransactionsDAO) Connect() {
	session, err := mgo.Dial(m.Server)
	if err != nil {
		log.Fatal(err)
	}
	db = session.DB(m.Database)
}

func (m *FinancialTransactionsDAO) FindAll() ([]FinancialTransaction, error) {
	var fiancialTransactions []FinancialTransaction
	err := db.C(COLLECTION).Find(bson.M{}).All(&fiancialTransactions)
	return fiancialTransactions, err
}

func (m *FinancialTransactionsDAO) FindByCpf(cpf string) ([]FinancialTransaction, error) {
	var fiancialTransactions []FinancialTransaction
	err := db.C(COLLECTION).FindId(bson.ObjectIdHex(cpf)).One(&FinancialTransaction)
	return fiancialTransactions, err
}
