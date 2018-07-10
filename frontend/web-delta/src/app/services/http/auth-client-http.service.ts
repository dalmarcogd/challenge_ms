import {Injectable} from '@angular/core';

import {HttpClient, HttpHeaders, HttpParams} from '@angular/common/http';
import {ServiceLocator} from '../service.locator';
import {HttpConfigRequest} from './http-config-request';
import {TokenService} from '../token/token.service';
import { AppSettingsService } from '../../app-settings.service';

/**
 * Serviço que implementa métodos de comunicação Http com autenticação apenas pelo client_credentials.
 */
@Injectable({ providedIn: 'root' })
export class AuthClientHttpService {

  private tokenService(): TokenService {
    return ServiceLocator.get(TokenService);
  }

  private httpClient(): HttpClient {
    return ServiceLocator.get(HttpClient);
  }

  private appSettingsService(): AppSettingsService {
    return ServiceLocator.get(AppSettingsService);
  }

  /**
   * Realiza um put no endereço especificado.
   */
  public delete<T>(url: string, config?: HttpConfigRequest): Promise<void | T> {
    config = config ? config : new HttpConfigRequest();
    const headers = this.getConfigHeaders();
    return this.formatURL(url).then(finalURL => {
      console.log('Method delete: ' + finalURL);
      return this.buildRequestOptions(headers, config).then(options => {
        return this.httpClient().delete<T>(finalURL, options).toPromise().then(response => this.extractData<T>(response));
      });
    });
  }

  /**
   * Realiza um put no endereço especificado.
   */
  public get<Array>(url: string, config?: HttpConfigRequest): Promise<void | Array> {
    config = config ? config : new HttpConfigRequest();
    const headers = this.getConfigHeaders();
    return this.formatURL(url).then(finalURL => {
      console.log('Method get: ' + finalURL);
      return this.buildRequestOptions(headers, config).then(options => {
        return this.httpClient().get<Array>(finalURL, options).toPromise().then(response => this.extractData<Array>(response));
      });
    });
  }
  /**
   * Realiza um put no endereço especificado.
   */
  public getById<T>(url: string, paramId: number): Promise<void | T> {
    const headers = this.getConfigHeaders();
    return this.formatURL(url).then(finalURL => {
      console.log('Method get: ' + finalURL);
      return this.buildRequestOptions(headers).then(options => {
        return this.httpClient().get<T>(finalURL + paramId + '/', options).toPromise().then(response => this.extractData<T>(response));
      });
    });
  }

  /**
   * Realiza um put no endereço especificado.
   */
  public put<T>(url: string, config?: HttpConfigRequest): Promise<void | T> {
    config = config ? config : new HttpConfigRequest();
    const headers = this.getConfigHeaders();
    return this.formatURL(url).then(finalURL => {
      console.log('Method put: ' + finalURL);
      return this.buildRequestOptions(headers, config).then(options => {
        return this.httpClient().put<T>(`${finalURL}${config.data.id}/`, options.body, options)
                        .toPromise().then(response => this.extractData<T>(response));
      });
    });
  }

  /**
   * Realiza um post no endereço especificado.
   */
  public post<T>(url: string, config?: HttpConfigRequest): Promise<any> {
    config = config ? config : new HttpConfigRequest();
    const headers = this.getConfigHeaders();
    return this.formatURL(url).then(finalURL => {
      console.log('Method post: ' + finalURL);
      return this.buildRequestOptions(headers, config).then(options => {
        return this.httpClient().post<T>(finalURL, options.body, options).toPromise().then(this.extractData);
      });
    });
  }

  /**
   * Método para criação padronizada do RequestOptions
   */
  private buildRequestOptions(headers: HttpHeaders, config?: HttpConfigRequest): Promise<any> {
    const p = new Promise((resolve, reject) => {
      const options = {headers: headers, body: JSON.stringify(config.data), params: new HttpParams()};
      if (!!config.params) {
        config.params.forEach((value: any, key: string) => {
          options.params = options.params.append(key, value);
        });
      }
      return this.tokenService().getClient().then( token => {
        if (token) {
          options.headers = options.headers.append('Authorization', 'Bearer ' + token.access_token);
        }
        resolve(options);
      });
    });

    return p;
  }

  private getConfigHeaders(): HttpHeaders {
    return new HttpHeaders().set('Content-Type', 'application/json');
  }

  private formatURL(url: string): Promise<string> {
    return this.appSettingsService().getValue('apiEndpoint').then(value => {
      return value + url;
    });
  }

  private extractData<T>(res: any): T {
    return res;
  }

  private handleError(error: Response | any) {
    // ServiceLocator.get(ApplicationErrorHandler).handleError(error);
    console.log(error);
  }
}
