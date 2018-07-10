import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { AppSettingsService } from '../../app-settings.service';
import { UserModel } from '../../models/user/user.model';
import { UserCrudService } from '../crud/user/user-crud.service';
import { AuthClientHttpService } from '../http/auth-client-http.service';
import { HttpService } from '../http/http.service';
import { MessageService } from '../message/message.service';
import { ServiceLocator } from '../service.locator';
import { TokenService } from '../token/token.service';
import { AuthCredential } from './auth.credential';
import { AuthRegister } from './auth.register';
import { AuthToken } from './auth.token';


@Injectable({ providedIn: 'root' })
export class AuthService {

  private router(): Router {
    return ServiceLocator.get(Router);
  }

  private userCrudService(): UserCrudService {
    return ServiceLocator.get(UserCrudService);
  }

  private authClientHttpService(): AuthClientHttpService {
    return ServiceLocator.get(AuthClientHttpService);
  }

  private httpService(): HttpService {
    return ServiceLocator.get(HttpService);
  }

  private tokenService(): TokenService {
    return ServiceLocator.get(TokenService);
  }

  private appSettingsService(): AppSettingsService {
    return ServiceLocator.get(AppSettingsService);
  }

  private messageService():  MessageService {
    return ServiceLocator.get(MessageService);
  }

  /**
   * Efetua a autenticação no servidor, com os parametros recebidos.
   */
  login(auth: AuthCredential): Promise<Boolean> {
    return Promise.all([
      this.appSettingsService().getValue('resourceOwnerPasswordBasedId').then((value) => value),
      this.appSettingsService().getValue('resourceOwnerPasswordBasedSecret').then((value) => value)
    ]).then((values) => {
      auth.username = auth.email.split('@')[0];
      const config = {
          data : auth,
          params: new Map([['grant_type', 'password'],
                           ['username', auth.username],
                           ['password', auth.password],
                           ['client_secret', values[1]],
                           ['client_id', values[0]],
                           ['scope', 'read write']])
      };
      return this.authClientHttpService().post('/oauth/token/', config).then((response) => {
          return this.tokenService().setToken(Object.assign(new AuthToken(), response), new Date()).then(() => {
            return this.userCrudService().get(`email=${auth.email}`).then((res: any) => {
              this.tokenService().setUser(res[0]);
              return true;
            });
          });
        }
      ).catch((response) => {
        console.log(response);
        return false;
      });
    });
  }

  register(authRegister: AuthRegister): Promise<Boolean> {
    return this.httpService().post('/public/user', {data : authRegister}).then((data) => {
        console.log(data);
        return true;
      }
    );
  }

  loginClient(): Promise<boolean> {
    return Promise.all([
      this.appSettingsService().getValue('clientCredentialId').then(value => value),
      this.appSettingsService().getValue('clientCredentialSecret').then(value => value)
    ]).then((values) => {
      return this.appSettingsService().getValue('apiEndpoint').then(endpoint => {
        const config = {
            params: new Map([['grant_type', 'client_credentials'],
                             ['client_secret', values[1]],
                             ['client_id', values[0]],
                             ['scope', 'read write']])
        };
        return this.httpService().post(endpoint + '/oauth/token/', config)
            .then((response) => {
            return this.tokenService().setClient(Object.assign(new AuthToken(), response)).then(() => {
              return true;
            });
          }
        ).catch(() => {
          return false;
        });
      });
    });
  }

  isClientLogged(): Promise<boolean> {
    return this.tokenService().getClient().then(token => {
      if (token != null && token !== undefined) {
        return this._isLogged(token.access_token).then((logged) => {
          if (logged) {
            return logged;
          }
          return this.tokenService().removeClient().then(() => {
            return logged;
          });
        });
      } else {
        return this.tokenService().removeClient().then(() => {
          return false;
        });
      }
    });
  }

  isUserLogged(): Promise<boolean> {
    return this.tokenService().getToken().then(token => {
      if (token != null && token !== undefined) {
        return this._isLogged(token.access_token).then((logged) => {
          return logged;
        });
      } else {
          return false;
      }
    });
  }

  private _isLogged(token: String): Promise<boolean> {
    return this.authClientHttpService().get('/oauth/check/', {params: new Map([['token', token]])}).then((response: any) => {
      return response.active;
    }).catch(() => {
      return false;
    });
  }

  getCurrentUser(): Promise<UserModel> {
    return this.tokenService().getUser();
  }

  refreshUser(): Promise<boolean> {
    return Promise.all([
      this.appSettingsService().getValue('resourceOwnerPasswordBasedId').then((value) => value),
      this.appSettingsService().getValue('resourceOwnerPasswordBasedSecret').then((value) => value),
      this.tokenService().getToken().then((value) => value),
    ]).then((values) => {
      if (values[2] && values[2].refresh_token) {
        const config = {
            params: new Map([['grant_type', 'refresh_token'],
                            ['refresh_token', values[2].refresh_token],
                            ['client_secret', values[1]],
                            ['client_id', values[0]]])
        };
        return this.authClientHttpService().post('/oauth/token/', config).then((response) => {
          return this.tokenService().setToken(Object.assign(new AuthToken(), response), new Date()).then(() => {
            return true;
          });
        }).catch(() => false);
      } else {
        this.messageService()
         .showError('Não foi possível autenticar você, por motivos de segurança voce será redirecionado para o login.');
        setTimeout(() => {
          this.router().navigate(['/login']);
        }, 3000);

        return false;
      }
    });
  }

  refreshClient(): Promise<boolean> {
    return this.appSettingsService().reload().then(() => this.loginClient());
  }

  logout(): Promise<any> {
    return this.tokenService().removeAll();
  }
}
