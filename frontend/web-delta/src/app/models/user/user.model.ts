import { BaseModel } from '../base/base.model';


export class UserModel extends BaseModel {

  private _password: String;
  private _last_login: Number;
  private _is_superuser: Boolean;
  private _username: String;
  private _first_name: String;
  private _last_name: String;
  private _email: String;
  private _is_staff: Boolean;
  private _is_active: Boolean;
  private _date_joined: Date;
  private _groups: Array<any>;
  private _user_permissions: Array<any>;

  get password(): String {
    return this._password;
  }

  set password(value: String) {
    this._password = value;
  }

  get last_login(): Number {
    return this._last_login;
  }

  set last_login(value: Number) {
    this._last_login = value;
  }

  get is_superuser(): Boolean {
    return this._is_superuser;
  }

  set is_superuser(value: Boolean) {
    this._is_superuser = value;
  }

  get username(): String {
    return this._username;
  }

  set username(value: String) {
    this._username = value;
  }

  get first_name(): String {
    return this._first_name;
  }

  set first_name(value: String) {
    this._first_name = value;
  }

  get last_name(): String {
    return this._last_name;
  }

  set last_name(value: String) {
    this._last_name = value;
  }

  get email(): String {
    return this._email;
  }

  set email(value: String) {
    this._email = value;
  }

  get is_staff(): Boolean {
    return this._is_staff;
  }

  set is_staff(value: Boolean) {
    this._is_staff = value;
  }

  get is_active(): Boolean {
    return this._is_active;
  }

  set is_active(value: Boolean) {
    this._is_active = value;
  }

  get date_joined(): Date {
    return this._date_joined;
  }

  set date_joined(value: Date) {
    this._date_joined = value;
  }

  get groups(): Array<any> {
    return this._groups;
  }

  set groups(value: Array<any>) {
    this._groups = value;
  }

  get user_permissions(): Array<any> {
    return this._user_permissions;
  }

  set user_permissions(value: Array<any>) {
    this._user_permissions = value;
  }
}
