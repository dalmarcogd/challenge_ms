package dao

import (
	"log"

	. "github.com/dalmarcogd/challenge_ms/backend/server_capa/src/models"
	mgo "gopkg.in/mgo.v2"
	"gopkg.in/mgo.v2/bson"
)

// FinancialTransactionsDAO dao struct
type FinancialTransactionsDAO struct {
	Server   string
	Database string
}

var db *mgo.Database

const (
	// COLLECTION name of collection
	COLLECTION = "FinancialTransactions"
)

// Connect Establish a connection to database
func (m *FinancialTransactionsDAO) Connect() {
	session, err := mgo.Dial(m.Server)
	if err != nil {
		log.Fatal(err)
	}
	db = session.DB(m.Database)
}

// FindAll list of FinancialTransactions
func (m *FinancialTransactionsDAO) FindAll() ([]FinancialTransaction, error) {
	var financialTransactions []FinancialTransaction
	err := db.C(COLLECTION).Find(bson.M{}).All(&financialTransactions)
	return financialTransactions, err
}

// Find a movie by its id
func (m *FinancialTransactionsDAO) FindByID(id string) (FinancialTransaction, error) {
	var financialTransaction FinancialTransaction
	err := db.C(COLLECTION).FindId(bson.ObjectIdHex(id)).One(&financialTransaction)
	return financialTransaction, err
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
