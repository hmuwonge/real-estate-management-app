import { Component } from '@angular/core';
import { Appointment } from '../models/appointment';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { OnInit } from '@angular/core';

@Component({
  selector: 'app-appointment-list',
  standalone: true,
  imports: [FormsModule, CommonModule],
  templateUrl: './appointment-list.component.html',
  styleUrls: ['./appointment-list.component.css']
})
export class AppointmentListComponent implements OnInit {
  newAppointmentTitle: string = "";
  newAppointmentDate: Date = new Date();

  appointments: Appointment[] = []

  ngOnInit(): void {
    let savedAppointments = localStorage.getItem('appointments')
    if (savedAppointments) {
      this.appointments = JSON.parse(savedAppointments)
    }else {
      this.appointments = []
    }
  }



  // appointment: Appointment = {
  //   id: 0,
  //   title: '',
  //   date: new Date()
  // }

  addAppointment() {
    if (this.newAppointmentTitle.trim().length && this.newAppointmentDate) {
      let newAppointment: Appointment = {
        id: this.appointments.length + 1,
        title: this.newAppointmentTitle,
        date: this.newAppointmentDate
      }

      this.appointments.push(newAppointment)

      this.newAppointmentTitle = ''
      this.newAppointmentDate = new Date()

      localStorage.setItem('appointments', JSON.stringify(this.appointments))
    }

  }

  deleteAppointment(index: number) {
    this.appointments.splice(index, 1)
    localStorage.setItem('appointments', JSON.stringify(this.appointments))
  }
}
