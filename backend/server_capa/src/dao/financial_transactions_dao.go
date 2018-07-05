package dao

import (
	"log"

	. "github.com/dalmarcogd/challenge_ms-restapi/backend/server_capa/src/models"
	mgo "gopkg.in/mgo.v2"
	"gopkg.in/mgo.v2/bson"
)

type FinancialTransactionsDAO struct {
	Server   string
	Database string
}

var db *mgo.Database

const (
	COLLECTION = "FinancialTransactions"
)

// Establish a connection to database
func (m *FinancialTransactionsDAO) Connect() {
	session, err := mgo.Dial(m.Server)
	if err != nil {
		log.Fatal(err)
	}
	db = session.DB(m.Database)
}

// Find list of FinancialTransactions
func (m *FinancialTransactionsDAO) FindAll() ([]FinancialTransaction, error) {
	var FinancialTransactions []FinancialTransaction
	err := db.C(COLLECTION).Find(bson.M{}).All(&FinancialTransactions)
	return FinancialTransactions, err
}

// Find a FinancialTransaction by its id
func (m *FinancialTransactionsDAO) FindById(id string) (FinancialTransaction, error) {
	var FinancialTransaction FinancialTransaction
	err := db.C(COLLECTION).FindId(bson.ObjectIdHex(id)).One(&FinancialTransaction)
	return FinancialTransaction, err
}

// Insert a FinancialTransaction into database
func (m *FinancialTransactionsDAO) Insert(FinancialTransaction FinancialTransaction) error {
	err := db.C(COLLECTION).Insert(&FinancialTransaction)
	return err
}

// Delete an existing FinancialTransaction
func (m *FinancialTransactionsDAO) Delete(FinancialTransaction FinancialTransaction) error {
	err := db.C(COLLECTION).Remove(&FinancialTransaction)
	return err
}

// Update an existing FinancialTransaction
func (m *FinancialTransactionsDAO) Update(FinancialTransaction FinancialTransaction) error {
	err := db.C(COLLECTION).UpdateId(FinancialTransaction.ID, &FinancialTransaction)
	return err
}
