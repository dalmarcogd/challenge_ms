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

// Connect Establish a connection to database
func (m *FinancialTransactionsDAO) Connect() {
	session, err := mgo.Dial(m.Server)
	if err != nil {
		log.Fatal(err)
	}
	db = session.DB(m.Database)
}

// FindAll list of FinancialTransactions
func (m *FinancialTransactionsDAO) FindAll(query interface{}) ([]FinancialTransaction, error) {
	var financialTransactions []FinancialTransaction
	err := db.C("FinancialTransactions").Find(query).All(&financialTransactions)
	return financialTransactions, err
}

// FindByQuery list of LastPurchases
func (m *FinancialTransactionsDAO) FindByQuery(query interface{}) ([]FinancialTransaction, error) {
	var financialTransactions []FinancialTransaction
	err := db.C("FinancialTransactions").Find(query).All(&financialTransactions)
	return financialTransactions, err
}

// FindByID a FinancialTransaction by its id
func (m *FinancialTransactionsDAO) FindByID(id string) (FinancialTransaction, error) {
	var financialTransaction FinancialTransaction
	err := db.C("FinancialTransactions").FindId(bson.ObjectIdHex(id)).One(&financialTransaction)
	return financialTransaction, err
}

// Insert a FinancialTransaction into database
func (m *FinancialTransactionsDAO) Insert(financialTransaction FinancialTransaction) error {
	err := db.C("FinancialTransactions").Insert(&financialTransaction)
	return err
}

// Delete an existing FinancialTransaction
func (m *FinancialTransactionsDAO) Delete(financialTransaction FinancialTransaction) error {
	err := db.C("FinancialTransactions").Remove(&financialTransaction)
	return err
}

// Update an existing FinancialTransaction
func (m *FinancialTransactionsDAO) Update(financialTransaction FinancialTransaction) error {
	err := db.C("FinancialTransactions").UpdateId(financialTransaction.ID, &financialTransaction)
	return err
}
