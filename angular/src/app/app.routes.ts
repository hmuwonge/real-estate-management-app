import { Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { RegisterComponent } from './components/register/register.component';
import { LoginComponent } from './components/login/login.component';
import { UserProfileComponent } from './components/user-profile/user-profile.component';
import { AuthGuardService } from './services/auth-guard.service';
import { PropertyDetailsComponent } from './components/property-details/property-details.component';

export const routes: Routes = [
  { path: "", component: HomeComponent },
  { path: 'auth/register', component: RegisterComponent },
  { path: 'auth/login', component: LoginComponent },
  {
    path: 'auth/profile', component: UserProfileComponent,
    canActivate: [AuthGuardService]
  },
  {
    path: 'auth/manage-properties', component: UserProfileComponent,
    canActivate: [AuthGuardService],
    data: { role: 'agent', expectedRole: 'agent' }
  },
  {
    path: 'auth/manage-properties/:id', component: UserProfileComponent,
    canActivate: [AuthGuardService],
    data: { role: 'agent', expectedRole: 'agent' }
  },
  {
    path: 'property/:id', component: PropertyDetailsComponent,
  }

];
