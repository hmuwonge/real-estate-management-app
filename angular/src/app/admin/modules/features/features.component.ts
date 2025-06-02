import { Component } from '@angular/core';
import { BaseCrudComponent } from '../../../core/base/base-crud/base-crud.component';
import { handleResponse } from '../../../shared/utils/HandleResponse';
import { catchError } from 'rxjs/operators';
import { throwError } from 'rxjs';
import { BaseService } from '../../../services/base/base.service';
import { Feature } from '../../../shared/models/feature.model';
import { FeaturesService } from '../../../services/features/features.service';
import { FeaturesListComponent } from '../list/features-list/features-list.component';
import { FeatureFormComponent } from '../form/features-form/feature-form.component';

@Component({
  selector: 'app-amenities',
  imports: [FeaturesListComponent, FeatureFormComponent],
  templateUrl: './features.component.html',
  standalone: true,
  styleUrl: './features.component.css'
})
export class FeaturesComponent extends BaseCrudComponent<Feature> {
  features: Feature[]=[]

  constructor(private featuresServices
    : FeaturesService) {
    super();
  }

  protected override getService(): BaseService<Feature> {
    return this.featuresServices
    ;
  }

  override loadEntities() {
    this.getService().getAll().pipe(handleResponse<Feature[]>())
      .subscribe({
        next:(response: Feature[]) => {
          if (!response || response.length === 0) {
            console.error('No similar properties found for the given ID:', response);
            // this.isLoading = false; // Set loading state to false if no data is found
            return;
          }
          // console.log('Similar properties fetched successfully:', response);
          this.features = response;
          // this.isLoading = false; // Set loading state to false after fetching data
        },
        error: (error) => {
          console.error('Error fetching similar properties:', error);
          // this.isLoading = false; // Set loading state to false on error
        }
      })
    }

  override onSubmit(formData: FormData) {
    this.getService().create(formData).pipe(
      handleResponse(),
      catchError(err => {
        console.error('Full error:', err);
        return throwError(err);
      })
    ).subscribe({
      next: (res) => console.log('Successful creation:', res),
      error: (err) => console.error('Creation failed:', err),
      complete: () => console.log('Create observable completed')
    });
  }


}
