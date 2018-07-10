import { BaseModel } from '../../models/base/base.model';


export class AuthToken extends BaseModel {
  private _access_token: string;
  private _expires_in: number;
  private _refresh_token: string;
  private _scope: string;
  private _token_type: string;

  public set access_token(access_token: string) {
    this._access_token = access_token;
  }

  public get access_tokne(): string {
    return this._access_token;
  }

  public set expires_in(expires_in: number) {
    this._expires_in = expires_in;
  }

  public get expires_in(): number {
    return this._expires_in;
  }

  public set refresh_token(refresh_token: string) {
    this._refresh_token = refresh_token;
  }

  public get refresh_token(): string {
    return this._refresh_token;
  }

  public set scope(scope: string) {
    this._scope = scope;
  }

  public get scope(): string {
    return this._scope;
  }

  public set token_type(token_type: string) {
    this._token_type = token_type;
  }

  public get token_type(): string {
    return this._token_type;
  }
}
