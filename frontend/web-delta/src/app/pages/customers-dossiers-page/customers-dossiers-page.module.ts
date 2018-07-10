import { NgModule, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { MatToolbarModule, MatTableModule, MatInputModule, MatPaginatorModule, MatProgressSpinnerModule, MatSortModule, MatIconModule, MatButtonModule, MatMenuModule, MatDialogModule, MatExpansionModule, MatDividerModule, MatListModule } from '@angular/material';
import { CustomersDossiersPageComponent } from './customers-dossiers-page.component';
import { CustomersDossiersPageRoutingModule } from './customers-dossiers-page-routing.module';
import { CommonModule } from '@angular/common';
import { CustomersDossiersDetailPageComponent } from './customers-dossiers-detail-page.component';
import { ReactiveFormsModule, FormsModule } from '../../../../node_modules/@angular/forms';
import { NgxMaskModule } from '../../../../node_modules/ngx-mask';
import { CpfPipe } from '../../pipes/cpf';

@NgModule({
  declarations: [
    CustomersDossiersPageComponent,
    CustomersDossiersDetailPageComponent,
    CpfPipe
  ],
  entryComponents: [CustomersDossiersDetailPageComponent],
  imports: [
    CommonModule,
    CustomersDossiersPageRoutingModule,
    MatToolbarModule,
    MatInputModule,
    MatTableModule,
    MatPaginatorModule,
    MatProgressSpinnerModule,
    MatSortModule,
    MatIconModule,
    MatButtonModule,
    MatMenuModule,
    MatDialogModule,
    MatExpansionModule,
    FormsModule,
    ReactiveFormsModule,
    MatDividerModule,
    MatListModule,
    NgxMaskModule
  ],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class CustomersDossiersPageModule { }
