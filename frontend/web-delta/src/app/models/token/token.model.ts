import {BaseModel} from '../base/base.model';

export class TokenModel extends BaseModel {

  private _access_token: String;
  private _expires_in: Number;
  private _token_type: String;
  private _scope: String;
  private _refresh_token: String;

  get access_token(): String {
    return this._access_token;
  }

  set access_token(value: String) {
    this._access_token = value;
  }

  get expires_in(): Number {
    return this._expires_in;
  }

  set expires_in(value: Number) {
    this._expires_in = value;
  }

  get token_type(): String {
    return this._token_type;
  }

  set token_type(value: String) {
    this._token_type = value;
  }

  get scope(): String {
    return this._scope;
  }

  set scope(value: String) {
    this._scope = value;
  }

  get refresh_token(): String {
    return this._refresh_token;
  }

  set refresh_token(value: String) {
    this._refresh_token = value;
  }

  parse(json: any): TokenModel {
    this.access_token = json._access_token;
    this.expires_in = json._expires_in;
    this.token_type = json._token_type;
    this.scope = json._scope;
    this.refresh_token = json._refresh_token;
    return this;
  }
}
