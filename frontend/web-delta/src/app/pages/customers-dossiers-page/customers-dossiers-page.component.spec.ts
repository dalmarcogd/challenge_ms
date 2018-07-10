import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CustomersDossiersPageComponent } from './customers-dossiers-page.component';

describe('CustomersDossiersPageComponent', () => {
  let component: CustomersDossiersPageComponent;
  let fixture: ComponentFixture<CustomersDossiersPageComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CustomersDossiersPageComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CustomersDossiersPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
