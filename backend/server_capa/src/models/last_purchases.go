package models

import (
	"time"

	"gopkg.in/mgo.v2/bson"
)

// LastPurchase - Represent the data of last customer purchase
type LastPurchase struct {
	ID          bson.ObjectId `bson:"_id" json:"id"`
	Description string        `bson:"description" json:"description"`
	Value       float64       `bson:"value" json:"value"`
	Date        time.Time     `bson:"date" json:"date"`
	Cpf         string        `bson:"cpf" json:"cpf"`
	PaymentType string        `bson:"PaymentType" json:"PaymentType"` // CreditCard
}
