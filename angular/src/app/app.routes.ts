import { Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { RegisterComponent } from './components/register/register.component';
import { LoginComponent } from './components/login/login.component';
import { UserProfileComponent } from './components/user-profile/user-profile.component';

export const routes: Routes = [
  {path:"",component:HomeComponent},
  // {path:"list",component:ReservationListComponent},
  { path: 'auth/register', component: RegisterComponent },
   { path: 'auth/login', component: LoginComponent },
   { path: 'auth/profile', component: UserProfileComponent },

];
