import { AfterViewInit, Component } from '@angular/core';
import { AuthService } from '../../services/auth/auth.service';
import { ServiceLocator } from '../../services/service.locator';
import { AuthCredential } from '../../services/auth/auth.credential';
import { FormBuilder, FormControl, Validators } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login-page',
  templateUrl: './login-page.component.html',
  styleUrls: ['./login-page.component.css']
})
export class LoginPageComponent implements AfterViewInit {

  loading = true;
  form;

  constructor(private formBuilder: FormBuilder, private router: Router) { 
    this.loading = false; 
    this.form = formBuilder.group({
      username: new FormControl('', Validators.compose([Validators.required])),
      password: new FormControl('', Validators.compose([Validators.required]))
    });
  }

  ngAfterViewInit() {
    
  }

  login() {
    if (this.form.valid) {
      this.authService().login(new AuthCredential(this.form.get('username').value, this.form.get('password').value )).then(isAuth => {
        if (isAuth) {
          this.router.navigate(['customers-dossiers']);
        }
      });
    }
    
  }

  private authService(): AuthService {
    return ServiceLocator.get(AuthService);
  }
}
