package dao

import (
	"log"

	. "github.com/dalmarcogd/challenge_ms/backend/server_capa/src/models"
	mgo "gopkg.in/mgo.v2"
	"gopkg.in/mgo.v2/bson"
)

// LastPurchasesDAO dao struct
type LastPurchasesDAO struct {
	Server   string
	Database string
}

// Connect Establish a connection to database
func (m *LastPurchasesDAO) Connect() {
	session, err := mgo.Dial(m.Server)
	if err != nil {
		log.Fatal(err)
	}
	db = session.DB(m.Database)
}

// FindAll list of LastPurchases
func (m *LastPurchasesDAO) FindAll(query interface{}) ([]LastPurchase, error) {
	var lastPurchases []LastPurchase
	err := db.C("LastPurchases").Find(query).All(&lastPurchases)
	return lastPurchases, err
}

// FindByID a LastPurchase by its id
func (m *LastPurchasesDAO) FindByID(id string) (LastPurchase, error) {
	var lastPurchase LastPurchase
	err := db.C("LastPurchases").FindId(bson.ObjectIdHex(id)).One(&lastPurchase)
	return lastPurchase, err
}

// FindByQuery list of LastPurchases
func (m *LastPurchasesDAO) FindByQuery(query interface{}) ([]LastPurchase, error) {
	var lastPurchases []LastPurchase
	err := db.C("LastPurchases").Find(query).All(&lastPurchases)
	return lastPurchases, err
}

// Insert a LastPurchase into database
func (m *LastPurchasesDAO) Insert(LastPurchase LastPurchase) error {
	err := db.C("LastPurchases").Insert(&LastPurchase)
	return err
}

// Delete an existing LastPurchase
func (m *LastPurchasesDAO) Delete(LastPurchase LastPurchase) error {
	err := db.C("LastPurchases").Remove(&LastPurchase)
	return err
}

// Update an existing LastPurchase
func (m *LastPurchasesDAO) Update(LastPurchase LastPurchase) error {
	err := db.C("LastPurchases").UpdateId(LastPurchase.ID, &LastPurchase)
	return err
}
