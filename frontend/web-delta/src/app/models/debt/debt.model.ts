import {BaseModel} from '../base/base.model';

export class DebtModel extends BaseModel {

  private _value: Number;
  private _date: Date;
  private _customer: Number;

    /**
     * Getter value
     * @return {Number}
     */
  public get value(): Number {
    return this._value;
  }

    /**
     * Getter date
     * @return {Date}
     */
  public get date(): Date {
    return this._date;
  }

    /**
     * Getter customer
     * @return {Number}
     */
  public get customer(): Number {
    return this._customer;
  }

    /**
     * Setter value
     * @param {Number} value
     */
  public set value(value: Number) {
    this._value = value;
  }

    /**
     * Setter date
     * @param {Date} value
     */
  public set date(value: Date) {
    this._date = value;
  }

    /**
     * Setter customer
     * @param {Number} value
     */
  public set customer(value: Number) {
    this._customer = value;
  }
}
