import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { RouterLink } from '@angular/router';
import { PropertiesService } from '../../services/properties/properties.service';
import { SimilarProperty } from '../../models/SimilarProperty.model';
import { handleResponse } from '../../shared/utils/HandleResponse';
import { UsersService } from '../../services/users/users.service';
import { PropertyType } from '../../models/PropertyDetails.mode';

@Component({
  selector: 'app-manage-properties',
  imports: [CommonModule, RouterLink],
  templateUrl: './manage-properties.component.html',
  standalone: true,
  styleUrl: './manage-properties.component.css'
})
export class ManagePropertiesComponent implements OnInit {
  userId: string | null;
  properties: SimilarProperty[] = []
  isLoading: boolean = true;
  isError: boolean = false;
  defaultImage: string = '/images/placeholder.jpg';

  constructor(private propertiesServices: PropertiesService, private userService: UsersService) {
    this.userId = localStorage.getItem('userId');
  }
  ngOnInit(): void {
    // const userType = localStorage.getItem('userId');
    const user = this.userService.getCurrentUser();
    console.log(user)

    if (user) {
      this.isLoading = true;
      this.isError = false;
      this.propertiesServices.getUserProperties(user.id).pipe(handleResponse<SimilarProperty[]>())
        .subscribe({
          next: (response: SimilarProperty[]) => {
            if (response) {
              this.properties = response
              // this.isLoading = false;
            }
          },
          error: (err) => {
            console.log(err)
          },
          complete: () => {
            this.isLoading = false;
          }

        })
    }



  }

  getPropertiesByStatus(status: string) {
    // Implement your filtering logic here
    return this.properties.filter(p => p.propertyType === status);
  }

  trackByPropertyId(index: number, estate: any) {
    return estate.id; // or your unique identifier
  }

}
