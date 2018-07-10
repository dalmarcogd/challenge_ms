import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { CustomersDossiersPageComponent } from './customers-dossiers-page.component';
import { AuthRouterActivate } from '../../services/auth/auth-router-activate';


const routes: Routes = [
  {
    path: '',
    component: CustomersDossiersPageComponent,
    canActivate: [AuthRouterActivate]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CustomersDossiersPageRoutingModule { }
