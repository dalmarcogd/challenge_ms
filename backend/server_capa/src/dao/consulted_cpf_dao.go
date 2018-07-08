package dao

import (
	"log"

	. "github.com/dalmarcogd/challenge_ms/backend/server_capa/src/models"
	mgo "gopkg.in/mgo.v2"
	"gopkg.in/mgo.v2/bson"
)

// ConsultedCPFDAO dao struct
type ConsultedCPFDAO struct {
	Server   string
	Database string
}

// Connect Establish a connection to database
func (m *ConsultedCPFDAO) Connect() {
	session, err := mgo.Dial(m.Server)
	if err != nil {
		log.Fatal(err)
	}
	db = session.DB(m.Database)
}

// FindAll list of ConsultedCPF
func (m *ConsultedCPFDAO) FindAll(query interface{}) ([]ConsultedCPF, error) {
	var consultedCPFs []ConsultedCPF
	err := db.C("ConsultedCPF").Find(query).All(&consultedCPFs)
	return consultedCPFs, err
}

// FindByID a ConsultedCPF by its id
func (m *ConsultedCPFDAO) FindByID(id string) (ConsultedCPF, error) {
	var consultedCPF ConsultedCPF
	err := db.C("ConsultedCPF").FindId(bson.ObjectIdHex(id)).One(&consultedCPF)
	return consultedCPF, err
}

// FindByQuery list of ConsultedCPF
func (m *ConsultedCPFDAO) FindByQuery(query interface{}) ([]ConsultedCPF, error) {
	var consultedCPFs []ConsultedCPF
	err := db.C("ConsultedCPF").Find(query).All(&consultedCPFs)
	return consultedCPFs, err
}

// Insert a ConsultedCPF into database
func (m *ConsultedCPFDAO) Insert(consultedCPF ConsultedCPF) error {
	err := db.C("ConsultedCPF").Insert(&consultedCPF)
	return err
}

// Delete an existing ConsultedCPF
func (m *ConsultedCPFDAO) Delete(consultedCPF ConsultedCPF) error {
	err := db.C("ConsultedCPF").Remove(&consultedCPF)
	return err
}

// Update an existing ConsultedCPF
func (m *ConsultedCPFDAO) Update(consultedCPF ConsultedCPF) error {
	err := db.C("ConsultedCPF").UpdateId(consultedCPF.ID, &consultedCPF)
	return err
}
