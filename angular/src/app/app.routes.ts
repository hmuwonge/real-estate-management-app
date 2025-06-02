import { Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { RegisterComponent } from './components/register/register.component';
import { LoginComponent } from './components/login/login.component';
import { UserProfileComponent } from './components/user-profile/user-profile.component';
import { AuthGuardService } from './services/auth/auth-guard.service';
import { PropertyDetailsComponent } from './components/property-details/property-details.component';
import { BuyPropertiesComponent } from './components/buy-properties/buy-properties.component';
// import { RentPropertiesComponent } from './components/rent-properties/rent-properties.component';
import { UnAuthorizedComponent } from './components/un-authorized/un-authorized.component';
import { ManagePropertiesComponent } from './components/manage-properties/manage-properties.component';
import { AgentDashboardComponent } from './components/agent-dashboard/agent-dashboard.component';
import { AmenitiesComponent } from './admin/modules/amenities/amenities.component';
import { CreatePropertyComponent } from './admin/modules/properties/create-property/create-property.component';
import { FeaturesComponent } from './admin/modules/features/features.component';

export const routes: Routes = [
  { path: "", component: HomeComponent },
  { path: 'auth/register', component: RegisterComponent },
  { path: 'auth/login', component: LoginComponent },
  {
    path:'unauthorized', component: UnAuthorizedComponent,
  },
  {
    path: 'auth/profile', component: UserProfileComponent,
    canActivate: [AuthGuardService]
  },
  {
    path: 'auth/manage-properties', component: ManagePropertiesComponent,
    canActivate: [AuthGuardService],
    data: { role: 'agent', expectedRole: 'agent' }
  },
  {
    path: 'auth/manage-properties/:id', component: ManagePropertiesComponent,
    canActivate: [AuthGuardService],
    data: { role: 'agent', expectedRole: 'agent' }
  },
  {
    path: 'property/:id', component: PropertyDetailsComponent,
  },
  {
    path: 'properties/buy', component: BuyPropertiesComponent,
  },
  {
    path: 'properties/rent', component: BuyPropertiesComponent,
  },
  {
    path: 'auth/dashboard', component: AgentDashboardComponent,
    canActivate: [AuthGuardService],
    data: { role: 'agent', expectedRole: 'agent' }
  },
   {
    path: 'auth/dashboard/create-property', component: CreatePropertyComponent,
    // canActivate: [AuthGuardService],
    data: { role: 'agent', expectedRole: 'agent' }
  },
  {
    path: 'auth/dashboard/amenities', component: AmenitiesComponent,
    canActivate: [AuthGuardService],
    data: { role: 'agent', expectedRole: 'agent' }
  },

  {
    path: 'auth/dashboard/features', component: FeaturesComponent,
    canActivate: [AuthGuardService],
    data: { role: 'agent', expectedRole: 'agent' }
  },

];
