import {Injectable} from '@angular/core';
import { BaseCrudService } from '../base-crud.service';
import { UserModel } from '../../../models/user/user.model';

@Injectable({ providedIn: 'root' })
export class UserCrudService extends BaseCrudService<UserModel> {

  protected getPatch(): string {
    return '/users/';
  }

  public assign(res: any): UserModel {
    return Object.assign(new UserModel(), res);
  }
}
