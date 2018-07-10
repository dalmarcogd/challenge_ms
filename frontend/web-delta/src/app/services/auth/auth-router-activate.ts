import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, Router } from "@angular/router";
import { Observable } from "rxjs";
import { ServiceLocator } from "../service.locator";
import { AuthService } from "./auth.service";
import { Injectable } from "@angular/core";

@Injectable({ providedIn:'root' })
export class AuthRouterActivate implements CanActivate {

    private authService(): AuthService {
        return ServiceLocator.get(AuthService);
    }

    private router(): Router {
        return ServiceLocator.get(Router);
    }

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<boolean> | Promise<boolean> | boolean {
        return this.authService().isUserLogged().then(isUserLogged => {
            if (!isUserLogged) {
                this.router().navigate(['/login']);
            }
            return isUserLogged;
        });
    }
}