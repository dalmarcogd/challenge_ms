import {Injectable} from '@angular/core';
import { BaseCrudService } from '../base-crud.service';
import { UserModel } from '../../../models/user/user.model';
import { CustomerDossierModel } from '../../../models/customer-dossier/customer-dossier.model';

@Injectable({ providedIn: 'root' })
export class CustomerDossierCrudService extends BaseCrudService<CustomerDossierModel> {

  protected getPatch(): string {
    return '/customers-dossiers/';
  }

  public assign(res: any): CustomerDossierModel {
    return Object.assign(new CustomerDossierModel(), res);
  }
}
