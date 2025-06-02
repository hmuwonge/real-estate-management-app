import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { RouterLink } from '@angular/router';
import { PropertiesService } from '../../services/properties/properties.service';
import { SimilarProperty } from '../../models/SimilarProperty.model';
import { handleResponse } from '../../shared/utils/HandleResponse';
import { UsersService } from '../../services/users/users.service';

@Component({
  selector: 'app-manage-properties',
  imports: [CommonModule, RouterLink],
  templateUrl: './manage-properties.component.html',
  standalone: true,
  styleUrl: './manage-properties.component.css'
})
export class ManagePropertiesComponent implements OnInit {
  userId: string | null;
  properties: SimilarProperty[] | [] = []

  constructor(private propertiesServices: PropertiesService, private userService: UsersService) {
    this.userId = localStorage.getItem('userId');
  }
  ngOnInit(): void {
    // const userType = localStorage.getItem('userId');
    const user = this.userService.getCurrentUser();
    console.log(user)

    if (user) {
      this.propertiesServices.getUserProperties(user.id).pipe(handleResponse<SimilarProperty[]>())
        .subscribe({
          next: (response: SimilarProperty[]) => {
            if (response) {
              this.properties = response
            }
          },
          error: (err) => {
            console.log(err)
          }

        })
    }



  }

}
