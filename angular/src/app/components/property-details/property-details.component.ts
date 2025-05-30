import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PropertiesService } from '../../services/properties.service';

@Component({
  selector: 'app-property-details',
  imports: [],
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

}
