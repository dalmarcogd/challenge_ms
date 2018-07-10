import {BaseModel} from '../base/base.model';

export class PatrimonyModel extends BaseModel {

  private _value: Number;
  private _description: String;
  private _customer_dossier: Number;

    /**
     * Getter value
     * @return {Number}
     */
  public get value(): Number {
    return this._value;
  }


    /**
     * Getter customer
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
     * Setter customer
     * @param {Number} value
     */
  public set customer_dossier(value: Number) {
    this._customer_dossier = value;
  }

    /**
     * Getter description
     * @return {String}
     */
	public get description(): String {
		return this._description;
	}

    /**
     * Setter description
     * @param {String} value
     */
	public set description(value: String) {
		this._description = value;
	}

}
