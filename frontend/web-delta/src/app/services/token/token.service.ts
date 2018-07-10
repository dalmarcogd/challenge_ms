import {Injectable} from '@angular/core';
import {ServiceLocator} from '../service.locator';
import {TokenModel} from '../../models/token/token.model';
import {UserModel} from '../../models/user/user.model';
import {StorageService} from '../storage/storage.service';

const TOKEN = 'token';
const TOKEN_CLIENT = 'token_client';
const USER = 'user';
const DATE_TOKEN = 'datetoken';

@Injectable({ providedIn: 'root' })
export class TokenService {

  private storageService(): StorageService {
    return ServiceLocator.get(StorageService);
  }

  /**
   * Atribui o token atual do usuario e a data.
   */
  public setToken(token: TokenModel, date: Date): Promise<any> {
    return this.storageService().set(TOKEN, JSON.stringify(token)).then(result => {
      this.storageService().set(DATE_TOKEN, JSON.stringify(date));
      return result;
    }).catch(() => {
      console.error('Error when persist TOKEN');
    });
  }

  public removeToken(): Promise<any> {
    return this.storageService().remove(TOKEN);
  }

  /**
   * Atribui o token atual do usuario e a data.
   */
  public setClient(token: TokenModel): Promise<any> {
    return this.storageService().set(TOKEN_CLIENT, JSON.stringify(token)).catch(() => {
      console.error('Error when persist TOKEN_CLIENT');
    });
  }

  public removeClient(): Promise<any> {
    return this.storageService().remove(TOKEN_CLIENT);
  }

  /**
   * Atribui o token atual do usuario e a data.
   */
  public setUser(user: UserModel): Promise<boolean> {
    return this.storageService().set(USER, JSON.stringify(user)).catch(() => {
      console.error('Error when persist USER');
    });
  }

  /**
   * Retorna o token to usuário
   */
  public removeAll(): Promise<boolean> {
    const p = new Promise<boolean>((resolve) => {
      this.storageService().remove(DATE_TOKEN).then(() => {
        this.storageService().remove(TOKEN).then(() => {
          this.storageService().remove(USER).then(() => resolve(true)).catch(() => resolve(false));
        }).catch(() => resolve(false));
      }).catch(() => resolve(false));
    });

    return p;
  }

  /**
   * Retorna o token to usuário
   */
  public getToken(): Promise<TokenModel> {
    return this.storageService().get(TOKEN).then( data => {
      return data ? Object.assign(new TokenModel(), JSON.parse(data)) : null;
    }).catch( data => {
      console.error('error get TOKEN ' + data);
      return data;
    });
  }

  /**
   * Retorna o token to usuário
   */
  public getClient(): Promise<TokenModel> {
    return this.storageService().get(TOKEN_CLIENT).then( data => {
      return data ? Object.assign(new TokenModel(), JSON.parse(data)) : null;
    }).catch( data => {
      console.error('error get TOKEN_CLIENT ' + data);
      return data;
    });
  }

  /**
   * Retorna a data que o token foi gerado.
   */
  public getDate(): Promise<Date> {
    return this.storageService().get(DATE_TOKEN).then( data => {
      return Object.assign(new Date(), data);
    }).catch( data => {
      console.error('error get DATE_TOKEN ' + data);
      return data;
    });
  }

  /**
   * Retorna a data que o token foi gerado.
   */
  public getUser(): Promise<UserModel> {
    return this.storageService().get(USER).then( data => {
      return data ? JSON.parse(data) : null;
    }).catch( data => {
      console.error('error get USER ' + data);
      return data;
    });
  }
}
