import { Component } from '@angular/core';
import { RouterOutlet,RouterLink } from '@angular/router';
// import { AppointmentListComponent } from "./appointment-list/appointment-list.component";

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet,RouterLink],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'Appointment';
}
