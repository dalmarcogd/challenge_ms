import { LayoutModule } from '@angular/cdk/layout';
import { HttpClientModule } from '@angular/common/http';
import { CUSTOM_ELEMENTS_SCHEMA, Injector, NgModule } from '@angular/core';
import { MatButtonModule, MatCardModule, MatIconModule, MatListModule, MatSidenavModule, MatToolbarModule } from '@angular/material';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { AngularWebStorageModule } from 'angular-web-storage';
import { NgxMaskModule } from 'ngx-mask';
import { AppRoutingModule } from './app-routing.module';
import { AppSettingsService } from './app-settings.service';
import { AppComponent } from './app.component';
import { MessageComponent } from './components/message/message.component';
import { NavComponent } from './components/nav/nav.component';
import { ServiceLocator } from './services/service.locator';


// Configuration values for our app
const APP_SETTINGS = {
  appName: 'Web Delta',
  apiEndpoint: 'http://127.0.0.1:8004/api',
  resourceOwnerPasswordBasedId: 'W1xemjuAEDNUqPuzZaETK1QxbKhGiGh0pic6sSlw',
  resourceOwnerPasswordBasedSecret: 'm6r7kkN6wJhSBp5UVaUGl6Uub7qgm6JpgMU0wrLAAwcW8QLBSesVctxagGbnI9mSVhTDajQWRjTUNGrWhNDopEco7GlSH9T6HpVNs8RjP0gClGau8SCOxU1ORXxI08IK',
  clientCredentialId: 'fRsMFNxdqAcmaTKXXiZXCwseN9f7wBL3L8igdRZH',
  clientCredentialSecret: 'mo1KxC26zoWyElPtXzSfVoT9kHyqyFtRgYnjDfGhNsz83vLaq5eMaSvTUH7tARhF5FBcAqha2qCK5WCSmXNhWjZQvLwQhGPr70ZuWSO0ruP9gzjI7iFLINhEDHeXTNFH'
};

export function provideSettings() {
  return new AppSettingsService(APP_SETTINGS);
}

@NgModule({
  declarations: [
    AppComponent,
    NavComponent,
    MessageComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    LayoutModule,
    HttpClientModule, 
    AppRoutingModule,
    AngularWebStorageModule,
    MatToolbarModule,
    MatButtonModule,
    MatSidenavModule,
    MatIconModule,
    MatListModule,
    MatCardModule,
    NgxMaskModule.forRoot()
  ],
  providers: [
    { provide: AppSettingsService, useFactory: provideSettings },
  ],
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
  bootstrap: [AppComponent]
})
export class AppModule {

  constructor(injector: Injector) {
    ServiceLocator.setInjector(injector);
  }
}
