import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PropertiesService } from '../../services/properties/properties.service';
import { CommonModule, NgOptimizedImage } from '@angular/common';
import { ImageSliderComponent } from '../image-slider/image-slider.component';
import { GoogleMapsModule } from '@angular/google-maps';
import { PropertyMapComponent } from "../property-map/property-map.component";
import { PropertyDetail } from '../../models/PropertyDetails.mode';
import { handleResponse } from '../../shared/utils/HandleResponse';
import { SimilarProperty } from '../../models/SimilarProperty.model';
import { PropertyCardComponent } from '../shared/property-card/property-card.component';

@Component({
  selector: 'app-property-details',
  imports: [CommonModule, GoogleMapsModule, ImageSliderComponent, PropertyCardComponent],
  templateUrl: './property-details.component.html',
  standalone: true,
  styleUrl: './property-details.component.css'
})
export class PropertyDetailsComponent implements OnInit {
  property: PropertyDetail | null = null;
  similarProperties: SimilarProperty[]=[];
  imageUrls: string[] = [];
  nearbyPlaces: any[] = [];
  amenities: string[] = [];
  isLoading = true;

  showWhatsAppModal = false;

  constructor(
    private route: ActivatedRoute,
    private propertyService: PropertiesService
  ) {

  }

  /**
   * Called when the component is initialized.
   * Fetches the property details from the backend,
   * and sets the property and imageUrls properties.
   * If the property has images, sets the imageUrls array
   * with the image urls.
   */
  ngOnInit() {
    const propertyId = this.route.snapshot.paramMap.get('id');
    if (propertyId) {
      this.isLoading = true; // Set loading state to true while fetching data
      this.propertyService.getPropertyDetails(propertyId).pipe(handleResponse<PropertyDetail>())
        .subscribe({
          next: (response: PropertyDetail) => {

            if (!response) {
              // console.error('No property details found for the given ID:', response);
              this.isLoading = false; // Set loading state to false if no data is found
              return;
            }
            // console.log('Property details fetched successfully:', response);
            this.property = response;
            if (this.property?.propertyImages) {
              this.imageUrls = this.property.propertyImages.map(img => img.url);

              console.log(this.imageUrls);
              this.nearbyPlaces = this.property.propertyNearbyPlaces || [];
            }

            if (this.property?.amenities) {
              this.amenities = this.property.amenities.map(amm => amm.name);
            }
          },
          error: (error) => {
            console.error('Error fetching home properties:', error);
          }
        });

        //fetch similar properties
        this.propertyService.getSimilarProperties(propertyId).pipe(handleResponse<SimilarProperty[]>())
        .subscribe({
          next:(response: SimilarProperty[]) => {
            if (!response || response.length === 0) {
              console.error('No similar properties found for the given ID:', response);
              this.isLoading = false; // Set loading state to false if no data is found
              return;
            }
            // console.log('Similar properties fetched successfully:', response);
            this.similarProperties = response;
            this.isLoading = false; // Set loading state to false after fetching data
          },
          error: (error) => {
            console.error('Error fetching similar properties:', error);
            this.isLoading = false; // Set loading state to false on error
          }
        })
    }


  }

  // toggleFullscreen() {
  //   const video = document.getElementById('tourVideo') as HTMLVideoElement;

  //   if (video.requestFullscreen) {
  //     video.requestFullscreen();
  //   } else if ((video as any).webkitRequestFullscreen) {
  //     (video as any).webkitRequestFullscreen(); // Safari
  //   } else if ((video as any).msRequestFullscreen) {
  //     (video as any).msRequestFullscreen(); // IE/Edge
  //   }
  // }

  toggleWhatsAppModal() {
  this.showWhatsAppModal = !this.showWhatsAppModal;
}
}
