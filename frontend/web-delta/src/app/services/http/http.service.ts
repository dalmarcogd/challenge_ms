import {Injectable} from '@angular/core';

import {HttpClient, HttpHeaders, HttpParams} from '@angular/common/http';
import {ServiceLocator} from '../service.locator';
import {HttpConfigRequest} from './http-config-request';

/**
 * Serviço que implementa métodos de comunicação Http.
 */
@Injectable()
export class HttpService {

  private getHttp(): HttpClient {
    return ServiceLocator.get(HttpClient);
  }

  /**
   * Realiza um put no endereço especificado.
   */
  public delete<T>(url: string, config?: HttpConfigRequest): Promise<void | T> {
    const headers = this.getConfigHeaders();
    const finalURL = this.formatURL(url);
    console.log('Method delete: ' + finalURL);
    return this.buildRequestOptions(headers, config).then(options => {
      return this.getHttp().delete<T>(finalURL, options).toPromise().then(response => this.extractData<T>(response));
    });
  }

  /**
   * Realiza um put no endereço especificado.
   */
  public get<Array>(url: string, config?: HttpConfigRequest): Promise<void | Array> {
    const headers = this.getConfigHeaders();
    const finalURL = this.formatURL(url);
    console.log('Method get: ' + finalURL);
    return this.buildRequestOptions(headers, config).then(options => {
      return this.getHttp().get<Array>(finalURL, options).toPromise().then(response => this.extractData<Array>(response));
    });
  }
    /**
     * Realiza um put no endereço especificado.
     */
  public getById<T>(url: string, paramId: number): Promise<void | T> {
      const headers = this.getConfigHeaders();
      const finalURL = this.formatURL(url);
      console.log('Method get: ' + finalURL);
      return this.buildRequestOptions(headers).then(options => {
        return this.getHttp().get<T>(finalURL + paramId, options).toPromise().then(response => this.extractData<T>(response));
      });
    }

  /**
   * Realiza um put no endereço especificado.
   */
  public put<T>(url: string, config?: HttpConfigRequest): Promise<void | T> {
    const headers = this.getConfigHeaders();
    const finalURL = this.formatURL(url);
    console.log('Method put: ' + finalURL);
    return this.buildRequestOptions(headers, config).then(options => {
      return this.getHttp().put<T>(finalURL, config.data, options).toPromise().then(response => this.extractData<T>(response));
    });

  }

  /**
   * Realiza um post no endereço especificado.
   */
  public post<T>(url: string, config?: HttpConfigRequest): Promise<any> {
    const headers = this.getConfigHeaders();
    const finalURL = this.formatURL(url);
    console.log('Method post: ' + finalURL);
    return this.buildRequestOptions(headers, config).then(options => {
      return this.getHttp().post<T>(finalURL, config.data, options).toPromise().then(response => this.extractData<T>(response));
    });
  }

  /**
   * Método para criação padronizada do RequestOptions
   */
  private buildRequestOptions(headers: HttpHeaders, config?: HttpConfigRequest): any {
    const p = new Promise((resolve, reject) => {
      const options = {headers: headers, params: new HttpParams()};
      if (config && config.params) {
        config.params.forEach((value: any, key: string) => {
          options.params = options.params.append(key, value);
        });
      }
      resolve(options);
    });
    return p;
  }

  private getConfigHeaders(): HttpHeaders {
    return new HttpHeaders().set('Content-Type', 'application/json');
  }

  private formatURL(url: string): string {
    return url;
  }

  private extractData<T>(res: any): T {
    return res;
  }

  private handleError(error: Response | any) {
    return error;
  }
}
