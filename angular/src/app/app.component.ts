import { Component } from '@angular/core';
import { RouterOutlet,RouterLink } from '@angular/router';
import { UsersService } from './services/users.service';
import { CommonModule } from '@angular/common';
// import { AppointmentListComponent } from "./appointment-list/appointment-list.component";

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet,RouterLink,CommonModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'Appointment';

  constructor(public usersService: UsersService) {
    // Initialize the user service to check authentication status
    this.usersService.isAuthenticated //= !!localStorage.getItem('accessToken');
    const isUserTypeValue = localStorage.getItem('userType');
    this.usersService.isAgent = isUserTypeValue != null && isUserTypeValue !== undefined && isUserTypeValue.toLowerCase() === 'agent';
    this.usersService.currentUser = localStorage.getItem('userName');
  }

  logout(): void {
    this.usersService.logout();
  }
}
