package models

import (
	"time"

	"gopkg.in/mgo.v2/bson"
)

// FinancialTransaction - Represent the data of financial transactions
type FinancialTransaction struct {
	ID          bson.ObjectId `bson:"_id" json:"id"`
	Description string        `bson:"description" json:"description"`
	Value       float64       `bson:"value" json:"value"`
	Date        time.Time     `bson:"date" json:"date"`
	Cpf         string        `bson:"cpf" json:"cpf"`
	Type        string        `bson:"type" json:"type"`               // Credit or Debit
	PaymentType string        `bson:"PaymentType" json:"PaymentType"` // CreditCard, DebitCard, PaymentSlip, Money
}
