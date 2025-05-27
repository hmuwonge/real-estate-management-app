import { Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
// import { ReservationListComponent } from './reservation-list/reservation-list.component';
import { ReservationFormComponent } from './reservation-form/reservation-form.component';
import { RegisterComponent } from './components/register/register.component';
import { LoginComponent } from './components/login/login.component';

export const routes: Routes = [
  {path:"",component:HomeComponent},
  // {path:"list",component:ReservationListComponent},
  {path:"new",component:ReservationFormComponent},
  { path: 'auth/register', component: RegisterComponent },
   { path: 'auth/login', component: LoginComponent },

];
