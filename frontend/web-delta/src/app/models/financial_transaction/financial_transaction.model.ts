import {BaseModel} from '../base/base.model';

export class FinancialTransactionModel extends BaseModel {

  private _value: Number;
  private _description: String;
  private _type_transaction: String;
  private _payment_type: String;
  private _date: Date;
  private _customer_dossier: Number;

    /**
     * Getter value
     * @return {Number}
     */
  public get value(): Number {
    return this._value;
  }

    /**
     * Getter description
     * @return {String}
     */
  public get description(): String {
    return this._description;
  }

    /**
     * Getter type_transaction
     * @return {String}
     */
  public get type_transaction(): String {
    return this._type_transaction;
  }

    /**
     * Getter payment_type
     * @return {String}
     */
  public get payment_type(): String {
    return this._payment_type;
  }

    /**
     * Getter date
     * @return {Date}
     */
  public get date(): Date {
    return this._date;
  }

    /**
     * Getter customer_dossier
     * @return {Number}
     */
  public get customer_dossier(): Number {
    return this._customer_dossier;
  }

    /**
     * Setter value
     * @param {Number} value
     */
  public set value(value: Number) {
    this._value = value;
  }

    /**
     * Setter description
     * @param {String} value
     */
  public set description(value: String) {
    this._description = value;
  }

    /**
     * Setter type_transaction
     * @param {String} value
     */
  public set type_transaction(value: String) {
    this._type_transaction = value;
  }

    /**
     * Setter payment_type
     * @param {String} value
     */
  public set payment_type(value: String) {
    this._payment_type = value;
  }

    /**
     * Setter date
     * @param {Date} value
     */
  public set date(value: Date) {
    this._date = value;
  }

    /**
     * Setter customer_dossier
     * @param {Number} value
     */
  public set customer_dossier(value: Number) {
    this._customer_dossier = value;
  }
}
