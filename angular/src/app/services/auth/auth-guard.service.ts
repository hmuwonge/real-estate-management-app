import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, Router, UrlTree } from '@angular/router';
import { UsersService } from '../users/users.service';
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

    // Get user data from localStorage
    const user = localStorage.getItem('user');

    if (!user) {
      this.router.navigate(['/auth/login'], {
        queryParams: { returnUrl: state.url }
      });
      return false;
    }

    try {
      const decodedUser = JSON.parse(user);
      const userType = decodedUser.userType;

      // Check if user is authenticated (using your service)
      const isAuthenticated = this.userService.isAuthenticated();

      if (isAuthenticated && userType) {
        // Check route role requirements
        if (route.data['expectedRole'] &&
          route.data['expectedRole'] !== userType.toLowerCase()) {
          this.router.navigate(['/unauthorized']);
          return false;
        }
        return true;
      } else {
        this.router.navigate(['/auth/login'], {
          queryParams: { returnUrl: state.url }
        });
        return false;
      }

    } catch (error) {
      console.error('Error parsing user data:', error);
      this.router.navigate(['/auth/login'], {
        queryParams: { returnUrl: state.url }
      });
      return false;
    }
  }


}
