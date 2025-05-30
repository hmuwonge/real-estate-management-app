import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PropertiesService } from '../../services/properties.service';
import { CommonModule } from '@angular/common';
import { ImageSliderComponent } from '../image-slider/image-slider.component';
import { GoogleMapsModule } from '@angular/google-maps';
import { PropertyMapComponent } from "../property-map/property-map.component";

@Component({
  selector: 'app-property-details',
  imports: [CommonModule, ImageSliderComponent, GoogleMapsModule, PropertyMapComponent],
  templateUrl: './property-details.component.html',
  styleUrl: './property-details.component.css'
})
export class PropertyDetailsComponent implements OnInit {
  propert: any;

  constructor(
     private route: ActivatedRoute,
    private propertyService: PropertiesService
  ) {
    // You can initialize properties or services here if needed
    this.propert = {}; // Example initialization

  }

  ngOnInit(){
    // Initialization logic can go here
    console.log('PropertyDetailsComponent initialized');

    const propertyId = this.route.snapshot.paramMap.get('id');
    if (propertyId) {
      this.propertyService.getPropertyDetails(propertyId).subscribe((response) => {
        this.propert = response.payload;
        console.log(this.propert);
      });
    }
  }

  toggleFullscreen() {
    const video = document.getElementById('tourVideo') as HTMLVideoElement;
  
    if (video.requestFullscreen) {
      video.requestFullscreen();
    } else if ((video as any).webkitRequestFullscreen) {
      (video as any).webkitRequestFullscreen(); // Safari
    } else if ((video as any).msRequestFullscreen) {
      (video as any).msRequestFullscreen(); // IE/Edge
    }
  }

}
