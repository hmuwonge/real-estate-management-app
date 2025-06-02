import { Component } from '@angular/core';
import { BaseCrudComponent } from '../../../core/base/base-crud/base-crud.component';
import { Amenity } from '../../../shared/models/amenity.model';
import { AmenitiesService } from '../../../services/amenities/amenities.service';
import { handleResponse } from '../../../shared/utils/HandleResponse';
import { SimilarProperty } from '../../../models/SimilarProperty.model';
import { AmenitiesListComponent } from '../list/amenities-list/amenities-list.component';
import { AmenityFormComponent } from '../form/amenity-form/amenity-form.component';
import { CommonModule, NgIf } from '@angular/common';
import { GeneralResponse } from '../../../shared/utils/GeneralResponse';
import { catchError } from 'rxjs/operators';
import { throwError } from 'rxjs';
import { BaseService } from '../../../services/base/base.service';

@Component({
  selector: 'app-amenities',
  imports: [AmenitiesListComponent, AmenityFormComponent,CommonModule],
  templateUrl: './amenities.component.html',
  standalone: true,
  styleUrl: './amenities.component.css'
})
export class AmenitiesComponent extends BaseCrudComponent<Amenity> {
  amenities: Amenity[]=[]
  errorMessage: string | null=null;
  successMessage: string | null=null;

  constructor(private amenitiesService: AmenitiesService) {
    super();
  }

  protected override getService(): BaseService<Amenity> {
    return this.amenitiesService;
  }

  override loadEntities() {
    this.getService().getAll().pipe(handleResponse<Amenity[]>())
      .subscribe({
        next:(response: Amenity[]) => {
          if (!response || response.length === 0) {
            console.error('No similar properties found for the given ID:', response);
            // this.isLoading = false; // Set loading state to false if no data is found
            return;
          }
          // console.log('Similar properties fetched successfully:', response);
          this.amenities = response;
          // this.isLoading = false; // Set loading state to false after fetching data
        },
        error: (error) => {
          console.error('Error fetching similar properties:', error);
          // this.isLoading = false; // Set loading state to false on error
        }
      })
    }

  override onSubmit(formData: FormData) {

    console.log(formData)
    this.getService().create(formData).pipe(
      handleResponse(),
      catchError(err => {
        console.error('Full error:', err);
        return throwError(err);
      })
    ).subscribe({
      next: (res) => {
        console.log(res)
      
        this.successMessage = "success"
      },
      error: (err) => console.error('Creation failed:', err),
      complete: () => {
        this.successMessage=null;
          this.loadEntities()
      }
    });
  }

  override onDelete(id: string): void {
     this.getService().delete(id).pipe(
      handleResponse(),
      catchError(err => {
        console.error('Full error:', err);
        return throwError(err);
      })
    ).subscribe({
      next: (res) => console.log('Successful creation:', res),
      error: (err) => {
        if(err)
          this.errorMessage = err
      },
      complete: () => {
        this.errorMessage =null;
      }
    });
  }


}
