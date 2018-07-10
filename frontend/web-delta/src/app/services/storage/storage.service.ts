import { Injectable } from '@angular/core';
import { ServiceLocator } from '../service.locator';
import { LocalStorageService } from 'angular-web-storage';

@Injectable({ providedIn: 'root' })
export class StorageService {

  private getStorage(): LocalStorageService {
    return ServiceLocator.get(LocalStorageService);
  }

  public get(key: string): Promise<any> {
    return new Promise(resolve => {
      resolve(this.getStorage().get(key));
    });
  }

  public set(key: string, value: any): Promise<any> {
    return new Promise(resolve => {
      this.getStorage().set(key, value);
      resolve(value);
    });
  }

  public remove(key: string): Promise<any> {
    return new Promise(resolve => {
      const value = this.getStorage().get(key);
      this.getStorage().remove(key);
      resolve(value);
    });
  }
}
