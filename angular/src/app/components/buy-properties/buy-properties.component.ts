import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule } from '@angular/forms';
import { PropertyType } from '../../models/PropertyDetails.mode';
import { Region } from '../../shared/models/region.model';
import { SimilarProperty } from '../../models/SimilarProperty.model';
import { PropertiesService } from '../../services/properties/properties.service';
import * as L from 'leaflet';
import { handleResponse } from '../../shared/utils/HandleResponse';
import { GeneralResponse } from '../../shared/utils/GeneralResponse';
import { CommonModule } from '@angular/common';
import { ActivatedRoute } from '@angular/router';
import { PropertyCardComponent } from '../shared/property-card/property-card.component';
@Component({
  selector: 'app-buy-properties',
  imports: [CommonModule, ReactiveFormsModule, PropertyCardComponent],
  standalone: true,
  templateUrl: './buy-properties.component.html',
  styleUrl: './buy-properties.component.css'
})
export class BuyPropertiesComponent implements OnInit {
  searchForm: FormGroup;
  propertyTypes: PropertyType[] = [];
  regions: Region[] = [];
  properties: SimilarProperty[] = [];
  map!: L.Map;
  markers: L.Marker[] = [];
  loading = false;
  totalResults: number | undefined = 0;
  sortDescending: boolean | false =true;
   propertyType: 'buy' | 'rent' = 'buy'; // Default to 'buy'
  pageTitle = 'Buy Your Perfect Property';

  // Predefined options for price and area
  priceRanges = [
    { label: 'Any Price', value: '' },
    { label: '$1,000 - $50,000', value: '1000-50000' },
    { label: '$50,000 - $100,000', value: '50000-100000' },
    { label: '$100,000 - $200,000', value: '100000-200000' },
    { label: '$200,000 - $300,000', value: '200000-300000' },
    { label: '$300,000 - $500,000', value: '300000-500000' },
    { label: '$500,000 - $750,000', value: '500000-750000' },
    { label: '$750,000 - $1M', value: '750000-1000000' },
    { label: 'Over $1M', value: '1000000-' }
  ];

  areaRanges = [
    { label: 'Any Area', value: '' },
    { label: '200 - 500 sqft', value: '200-500' },
    { label: '500 - 1,000 sqft', value: '500-1000' },
    { label: '1,000 - 1,500 sqft', value: '1000-1500' },
    { label: '1,500 - 2,000 sqft', value: '1500-2000' },
    { label: '2,000 - 3,000 sqft', value: '2000-3000' },
    { label: '3,000 - 5,000 sqft', value: '3000-5000' },
    { label: 'Over 5,000 sqft', value: '5000-' }
  ];


    private mapInitialized = false;
  constructor(
    private propertiesService: PropertiesService,
    private fb: FormBuilder,
     private route: ActivatedRoute
  ) {
    this.searchForm = this.fb.group({
      GovernorateId: [''],
      status: ['Sell'],
      type: [''],
      priceRange: [''],
      areaRange: [''],
      searchString: [''],
      minPrice: [''],
      maxPrice: [''],
      minArea: [''],
      maxArea: [''],
      sortDescending: [false]
    });
  }
  ngOnInit(): void {
    this.route.params.subscribe(params => {
      this.propertyType = params['type'] === 'rent' ? 'rent' : 'buy';
      console.log('Property Type:', this.propertyType);
      this.updatePageTitle();

      // Update form status based on route
      this.searchForm.patchValue({
        status: this.propertyType === 'rent' ? 'Rent' : 'Sell'
      });
    });

    // Initialize map only once
      if (!this.mapInitialized) {
        this.initMap();
        this.mapInitialized = true;
      }


    // this.initMap();
    this.loadFilters();
    this.searchProperties();
  }

  private updatePageTitle(): void {
    this.pageTitle = this.propertyType === 'rent'
      ? 'Rent Your Perfect Property'
      : 'Buy Your Perfect Property';
  }


  initMap(): void {
    this.map = L.map('map').setView([51.505, -0.09], 13);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '© OpenStreetMap contributors'
    }).addTo(this.map);
  }

  loadFilters(): void {
    this.propertiesService.getPropertyTypes().pipe(handleResponse<PropertyType[]>()).subscribe({
      next: (response: PropertyType[]) => {
        this.propertyTypes = response;
      },

      error: (error) => {
        console.error('Error fetching home properties:', error);
      }

    });



    this.propertiesService.getRegions().pipe(handleResponse<Region[]>()).subscribe({
      next: (response: Region[]) => {
        this.regions = response
      },
      error: (error) => {
        console.error('Error fetching home properties:', error);
      }
    })

  }


  searchProperties(): void {
    this.loading = true;
    const formValue = this.searchForm.value;
    const filters: any = {
      GovernorateId: formValue.GovernorateId,
      status: formValue.status,
      type: formValue.type,
      sortDescending: formValue.sortDescending
    };

    // Process price range if selected
    if (formValue.priceRange) {
      const [minPrice, maxPrice] = formValue.priceRange.split('-');
      if (minPrice) filters.minPrice = minPrice;
      if (maxPrice) filters.maxPrice = maxPrice;
    }

    // Process area range if selected
    if (formValue.areaRange) {
      const [minArea, maxArea] = formValue.areaRange.split('-');
      if (minArea) filters.minArea = minArea;
      if (maxArea) filters.maxArea = maxArea;
    }

    this.propertiesService.getPropertiesBuyRent(filters).pipe(handleResponse<SimilarProperty[]>()).subscribe({
      next: (response) => {
        this.properties = response;
        this.totalResults = response?.length;
        this.updateMapMarkers();
        this.loading = false;
      },
      error: (err) => {
        console.error('Error fetching properties:', err);
        this.loading = false;
      }
    });
  }

   updateMapMarkers(): void {
    // Clear existing markers
    this.markers.forEach(marker => this.map.removeLayer(marker));
    this.markers = [];

    // Add new markers
    this.properties.forEach(property => {
      if (property.latitude && property.longitude) {
        const marker = L.marker([property.latitude, property.longitude])
          .addTo(this.map)
          .bindPopup(`<b>${property.title}</b><br>$${property.price.toLocaleString()}`);

        this.markers.push(marker);
      }
    });

    // Fit map to bounds if we have markers
    if (this.markers.length > 0) {
      const group = new L.FeatureGroup(this.markers);
      this.map.fitBounds(group.getBounds().pad(0.2));
    }
  }

  private clearMarkers(): void {
    this.markers.forEach(marker => this.map.removeLayer(marker));
    this.markers = [];
  }

  centerMapOnProperty(property: SimilarProperty): void {
    if (property.latitude && property.longitude) {
      this.map.setView([property.latitude, property.longitude], 15);
    }
  }

  resetFilters(): void {
    this.searchForm.reset({
      status: 'Sell',
      GovernorateId: '',
      type: '',
      priceRange: '',
      areaRange: '',
      sortDescending: false
    });
    this.searchProperties();
  }
}
