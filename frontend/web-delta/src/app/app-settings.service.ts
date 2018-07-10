import { Injectable } from '@angular/core';
import { ServiceLocator } from './services/service.locator';
import { StorageService } from './services/storage/storage.service';

export interface AppSettings {
  appName: string;
  apiEndpoint: string;
  resourceOwnerPasswordBasedId: string;
  resourceOwnerPasswordBasedSecret: string;
  clientCredentialId: string;
  clientCredentialSecret: string;
}

/**
 * A simple settings/config class for storing key/value pairs with persistence.
 */
@Injectable()
export class AppSettingsService {
  private SETTINGS_KEY: '_settings';

  settings: any;

  _defaults: any;
  _readyPromise: Promise<any>;

  constructor(defaults: any) {
    this._defaults = defaults;
    this.load();
  }

  private storage(): StorageService {
    return ServiceLocator.get(StorageService);
  }

  load() {
    return this.storage().get(this.SETTINGS_KEY).then((value) => {
      if (value) {
        this.settings = value;
        return this._mergeDefaults(this._defaults);
      } else {
        return this.setAll(this._defaults).then((val) => {
          this.settings = val;
        });
      }
    });
  }

  reload(): Promise<any> {
    return this.storage().remove(this.SETTINGS_KEY).then(() => {
      return this.load();
    });
  }

  _mergeDefaults(defaults: any) {
    for (const k in defaults) {
      if (!(k in this.settings)) {
        this.settings[k] = defaults[k];
      }
    }
    return this.setAll(this.settings);
  }

  merge(settings: any) {
    for (const key in settings) {
        if (key) {
            this.settings[key] = settings[key];
        }
    }

    return this.save();
  }

  setValue(key: string, value: any) {
    this.settings[key] = value;
    return this.storage().set(this.SETTINGS_KEY, this.settings);
  }

  setAll(value: any) {
    return this.storage().set(this.SETTINGS_KEY, value);
  }

  getValue(key: string) {
    return this.storage().get(this.SETTINGS_KEY)
      .then(settings => {
        return settings[key];
      });
  }

  save() {
    return this.setAll(this.settings);
  }

  get allSettings() {
    return this.settings;
  }
}
