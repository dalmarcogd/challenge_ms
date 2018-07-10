import { Component, AfterViewInit, ViewChild } from '@angular/core';
import { MatTableDataSource, MatPaginator, MatSort, MatDialog } from '@angular/material';
import { ServiceLocator } from '../../services/service.locator';
import { CustomerDossierCrudService } from '../../services/crud/customers-dossiers/customers-dossiers-crud.service';
import { CustomerDossierModel } from '../../models/customer-dossier/customer-dossier.model';
import { CustomersDossiersDetailPageComponent } from './customers-dossiers-detail-page.component';

@Component({
  selector: 'app-customers-dossiers-page',
  templateUrl: './customers-dossiers-page.component.html',
  styleUrls: ['./customers-dossiers-page.component.css']
})
export class CustomersDossiersPageComponent implements AfterViewInit {

  loading = true;
  cpf = '';

  displayedColumns = ['name', 'cpf', 'date_birth', 'address', 'id'];
  dataSource = new MatTableDataSource([]);
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  constructor(private matDialog: MatDialog) {}

  ngAfterViewInit() {
    this.reload();
  }

  openDialog(id): void {
    const dialogRef = this.matDialog.open(CustomersDossiersDetailPageComponent, {
      width: '90%',
      height: '90%',
      data: id
    });
  }

  getCustomerDossie() {
    this.customerDossierCrudService().get(`cpf=${this.cpf}`).then(() => {
      this.cpf = '';
    }).catch(() => {
      this.cpf = '';
    });
  }

  reload() {
    this.loading = true;
    this.customerDossierCrudService().get().then(customers => {
      this.dataSource = new MatTableDataSource(customers);
      this.dataSource.paginator = this.paginator;
      this.dataSource.sort = this.sort;
      this.loading = false;
    }).catch(() => {
      this.loading = false;
    });
  }

  private customerDossierCrudService(): CustomerDossierCrudService {
    return ServiceLocator.get(CustomerDossierCrudService);
  }
}
