import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

const routes: Routes = [
  {
    path: 'customers-dossiers',
    loadChildren: 'src/app/pages/customers-dossiers-page/customers-dossiers-page.module#CustomersDossiersPageModule'
  },
  {
    path: 'login',
    loadChildren: 'src/app/pages/login/login-page.module#LoginPageModule'
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
