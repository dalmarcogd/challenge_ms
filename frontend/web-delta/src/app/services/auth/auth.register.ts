import {BaseModel} from '../../models/base/base.model';

export class AuthRegister extends  BaseModel {
  private _name: String;
  private _username: String;
  private _email: String;
  private _password: String;

  public get name(): String {
    return this._name;
  }

  public set name(name: String) {
    this._name = name;
  }

  public get email(): String {
    return this._email;
  }

  public set email(email: String) {
    this._email = email;
    this._username = email.split('@')[0];
  }

  public get password(): String {
    return this._password;
  }

  public set password(password: String) {
    this._password = password;
  }
}
