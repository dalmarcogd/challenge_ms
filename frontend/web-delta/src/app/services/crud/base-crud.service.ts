import {AuthHttpService} from '../http/auth-http.service';
import {ServiceLocator} from '../service.locator';
import { DEFAULT_PAGE_SIZE } from '../../app.constants';


export abstract class BaseCrudService<T> {

  protected authHttpService(): AuthHttpService {
    return ServiceLocator.get(AuthHttpService);
  }

  protected abstract getPatch(): string;

  /**
   * Retorna o dado especificado ou os dados do backend.
   */
  public get(filter?: string): Promise<Array<T>> {
    return this.authHttpService().get<Array<T>>(filter ? `${this.getPatch()}?${filter} ` : this.getPatch()).then(res => {
      const results: Array<T> = [];
      if (res instanceof Array) {
        res.forEach(element => {
          results.push(this.assign(element));
        });
      }
      return results;
    });
  }

  /**
   * Retorna o dado especificado ou os dados do backend.
   */
  public search(filter?: string, pageSize?: number, orders?: string): Promise<void | Array<T>> {
    pageSize = pageSize ? pageSize : DEFAULT_PAGE_SIZE;
    orders = orders ? orders : '-id';
    return this.authHttpService().get<Array<T>>(this.getPatch() + `?${filter ? filter : ''}&page_size=${pageSize}&orders=${orders}`)
        .then(res => {
            const results: Array<T> = [];
            if (res instanceof Array) {
                res.forEach(element => {
                results.push(this.assign(element));
                });
            }
            return results;
            });
  }

  /**
   * Retorna o dado especificado ou os dados do backend.
   */
  public getById(id: Number): Promise<T> {
    return this.authHttpService().getById<T>(this.getPatch(), id).then(res => {
      let result: T;
      if (res) {
        result = this.assign(res);
      }
      return result;
    });
  }

  /**
   * Executa a criação do dado no backend.
   */
  public post(data: T): Promise<T> {
    return this.authHttpService().post(this.getPatch(), {data: data}).then(res => {
      let result: T;
      if (res) {
        result = this.assign(res);
      }
      return result;
    });
  }

  /**
   * Executa a atualização dos dados no backend.
   */
  public put(data: T): Promise<T> {
    return this.authHttpService().put(this.getPatch(), {data: data}).then(res => {
      let result: T;
      if (res) {
        result = this.assign(res);
      }
      return result;
    });
  }

  /**
   * Executa a atualização dos dados no backend.
   */
  public delete(id: Number): Promise<T> {
    return this.authHttpService().delete(this.getPatch() + id + '/').then(res => {
      let result: T;
      if (res) {
        result = this.assign(res);
      }
      return result;
    });
  }

  protected abstract assign(res: any): T;
}
