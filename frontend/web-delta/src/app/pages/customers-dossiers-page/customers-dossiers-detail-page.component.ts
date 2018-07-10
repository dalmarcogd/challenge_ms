import { AfterViewInit, Component, Inject, ViewChild, ViewChildren, QueryList } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA, MatTableDataSource, MatPaginator, MatSort } from '@angular/material';
import { CustomerDossierCrudService } from '../../services/crud/customers-dossiers/customers-dossiers-crud.service';
import { ServiceLocator } from '../../services/service.locator';
import { CustomerDossierModel } from '../../models/customer-dossier/customer-dossier.model';
import { FormBuilder, FormControl } from '../../../../node_modules/@angular/forms';

@Component({
  selector: 'app-customers-dossiers-detail-page',
  templateUrl: './customers-dossiers-detail-page.component.html',
  styleUrls: ['./customers-dossiers-detail-page.component.css']
})
export class CustomersDossiersDetailPageComponent implements AfterViewInit {

  loading = true;
  customerDossier: CustomerDossierModel;

  displayedColumnsDebts = ['date', 'value'];
  dataSourceDebts = new MatTableDataSource();  

  displayedColumnsPatrimonies = ['description', 'value'];
  dataSourcePatrimonies = new MatTableDataSource();

  displayedColumnsFinancialTransactions = ['description', 'date', 'type_transaction', 'value'];
  dataSourceFinancialTransactions = new MatTableDataSource();

  displayedColumnsSourcesIncome = ['description', 'value'];
  dataSourceSourcesIncome = new MatTableDataSource();

  constructor(public dialogRef: MatDialogRef<CustomersDossiersDetailPageComponent>, @Inject(MAT_DIALOG_DATA) public data: Number) {}

  ngAfterViewInit() {
    this.customerDossierCrudService().getById(this.data).then(customerDossier => {
      this.customerDossier = customerDossier;
      this.dataSourceDebts = new MatTableDataSource(this.customerDossier.debts);
      this.dataSourcePatrimonies = new MatTableDataSource(this.customerDossier.patrimonies);
      this.dataSourceFinancialTransactions = new MatTableDataSource(this.customerDossier.financial_transactions);
      this.dataSourceSourcesIncome = new MatTableDataSource(this.customerDossier.sources_income);
      this.loading = false;
    }).catch(() => {
      this.loading = false;
    });
  }

  close() {
    this.dialogRef.close();
}

  getTotalDebts(): Number {
    return this.customerDossier.debts.map(t => t.value).reduce((acc, value) => +acc + +value, 0);
  }

  getTotalPatrimonies(): Number {
    return this.customerDossier.patrimonies.map(t => t.value).reduce((acc, value) => +acc + +value, 0);
  }

  getTotalSourcesIncome(): Number {
    return this.customerDossier.sources_income.map(t => t.value).reduce((acc, value) => +acc + +value, 0);
  }

  private customerDossierCrudService(): CustomerDossierCrudService {
    return ServiceLocator.get(CustomerDossierCrudService);
  }
}
