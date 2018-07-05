package models

import (
	"time"

	"gopkg.in/mgo.v2/bson"
)

// FinancialTransaction - Represent the data of financial transactions
type FinancialTransaction struct {
	ID          bson.ObjectId `bson:"_id" json:"id"`
	Description string        `bson:"description" json:"description"`
	Date        time.Time     `bson:"date" json:"date"`
	Cpf         string        `bson:"cpf" json:"cpf"`
}
