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

var db *mgo.Database

const (
	// COLLECTION name of collection
	COLLECTION = "LastPurchases"
)

// Connect Establish a connection to database
func (m *LastPurchasesDAO) Connect() {
	session, err := mgo.Dial(m.Server)
	if err != nil {
		log.Fatal(err)
	}
	db = session.DB(m.Database)
}

// FindAll list of LastPurchases
func (m *LastPurchasesDAO) FindAll() ([]LastPurchase, error) {
	var LastPurchases []LastPurchase
	err := db.C(COLLECTION).Find(bson.M{}).All(&LastPurchases)
	return LastPurchases, err
}

// Find a movie by its id
func (m *LastPurchasesDAO) FindByID(id string) (LastPurchase, error) {
	var lastPurchase LastPurchase
	err := db.C(COLLECTION).FindId(bson.ObjectIdHex(id)).One(&lastPurchase)
	return LastPurchase, err
}

// Insert a LastPurchase into database
func (m *LastPurchasesDAO) Insert(LastPurchase LastPurchase) error {
	err := db.C(COLLECTION).Insert(&LastPurchase)
	return err
}

// Delete an existing LastPurchase
func (m *LastPurchasesDAO) Delete(LastPurchase LastPurchase) error {
	err := db.C(COLLECTION).Remove(&LastPurchase)
	return err
}

// Update an existing LastPurchase
func (m *LastPurchasesDAO) Update(LastPurchase LastPurchase) error {
	err := db.C(COLLECTION).UpdateId(LastPurchase.ID, &LastPurchase)
	return err
}
