package models

import (
	"time"

	"gopkg.in/mgo.v2/bson"
)

// ConsultedCPF - Represent the data of customer's consulted by CPF
type ConsultedCPF struct {
	ID   bson.ObjectId `bson:"_id" json:"id"`
	Date time.Time     `bson:"date" json:"date"`
	Cpf  string        `bson:"cpf" json:"cpf"`
}
