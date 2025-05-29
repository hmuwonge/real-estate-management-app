import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, Router, UrlTree } from '@angular/router';
import { UsersService } from './users.service';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})

export class AuthGuardService implements CanActivate {
  constructor(private userService: UsersService, private router: Router) { }

  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
  ): Observable<boolean> | UrlTree | Promise<boolean> | UrlTree | boolean {

    const isAuthenticated = this.userService.isAuthenticated;

    const userType = localStorage.getItem('userType');

    // check if user is authenticated and has a user type
    if (isAuthenticated() && userType) {
      console.log('AuthGuard: User is authenticated:', isAuthenticated());
      console.log('AuthGuard: User type:', userType);
      console.log('AuthGuard: Route data:', route.data);
      // Check if the route has an expected role and if it matches the user's role
      if (route.data['expectedRole'] && route.data['expectedRole'] !== userType.toLowerCase()) {
        this.router.navigate(['/unauthorized']);
        return false;
      }
      return true;

    } else {
      this.router.navigate(['/auth/login'], {
         queryParams: { returnUrl: state.url } });
      return false;
    }
  }


}
