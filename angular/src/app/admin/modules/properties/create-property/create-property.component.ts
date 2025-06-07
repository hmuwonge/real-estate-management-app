import { CommonModule } from '@angular/common';
import { Component, OnInit, Inject, NgModule, OnDestroy } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  Validators,
  FormControl,
  FormArray,
  NgModel
} from '@angular/forms';
// import { PropertyService } from '../../../../shared/services/property.service';
import { PropertiesService } from '../../../../services/properties/properties.service';
import { ReactiveFormsModule } from '@angular/forms';
import { FormsModule } from '@angular/forms';
import { PropertyType } from '../../../../shared/models/type.mode';
import { Feature } from '../../../../shared/models/feature.model';
import { Amenity } from '../../../../shared/models/amenity.model';
import { GeneralResponse } from '../../../../shared/utils/GeneralResponse';
import { Region } from '../../../../shared/models/region.model';
import { FeaturesService } from '../../../../services/features/features.service';
import { handleResponse } from '../../../../shared/utils/HandleResponse';
import { catchError, of } from 'rxjs';
import { AmenitiesService } from '../../../../services/amenities/amenities.service';
import { UsersService } from '../../../../services/users/users.service';
import { Governorate } from 'src/app/shared/models/governorate.model';

type PropertyStatus = 'Sell' | 'Rent' | 'Sold' | 'Rented';

@Component({
  selector: 'app-create-property',
  imports: [CommonModule, ReactiveFormsModule,FormsModule],
templateUrl: './create-property.component.html',
  standalone: true,
  styleUrls: ['./create-property.component.css']
})
export class CreatePropertyComponent implements OnInit, OnDestroy {
  currentStep = 1;
  form: FormGroup;
  submitted = false;
  loading = false;
  newNearbyPlace = '';

  steps = [
    { number: 1, title: 'Basic Info' },
    { number: 2, title: 'Property Details' },
    { number: 3, title: 'Features & Amenities' },
    { number: 4, title: 'Review & Submit' }
  ];

  propertyTypes: PropertyType[] = [];
  governorates: Governorate[] = [];
  allFeatures: Feature[] = [];
  allAmenities: Amenity[] = [];
  propertyStatuses: PropertyStatus[] = ['Sell', 'Rent',];

  selectedFeatures: string[] = [];
  selectedAmenities: string[] = [];
  nearbyPlaces: string[] = [];

  featureSearchQuery = '';
  filteredFeatures: Feature[] = [];

  constructor(
    private fb: FormBuilder,
    @Inject(PropertiesService) private propertiesService: PropertiesService,
    private featuresService: FeaturesService,
    private amenitiesService: AmenitiesService,
    private userService: UsersService
  ) {

     const user = this.userService.getCurrentUser();
    this.form = this.fb.group({
      // Step 1
      title: ['', [Validators.required, Validators.minLength(5), Validators.maxLength(128)]],
      description: ['', Validators.required],
      propertyTypeId: ['', Validators.required],
      governorateId: ['', Validators.required],
      mainImage: [null, Validators.required],
      photoUrls: [[]],
      videoUrl: [null],

      // Step 2
      price: [0, [Validators.required, Validators.min(0)]],
      insurancePayment: [0, Validators.min(0)],
      area: [0, [Validators.required, Validators.min(0)]],
      rooms: [0, [Validators.min(0), Validators.max(1000)]],
      status: ['Sell', Validators.required],
      paymentType: [''],
      address: [''],
      latitude: [0, Validators.required],
      longitude: [0, Validators.required],
      ownerId:user.id,

      // Step 4
      terms: [false, Validators.requiredTrue]
    });
  }

  ngOnInit(): void {
    this.loadPropertyTypes();
    this.loadGovernorates();
    this.loadFeatures();
    this.loadAmenities();
  }

  loadPropertyTypes(): void {
    this.propertiesService.getPropertyTypes().subscribe(
      (response: GeneralResponse<PropertyType[]>) => {
        if (response && response.payload) {
          this.propertyTypes = response.payload;
        } else {
          this.propertyTypes = [];
          console.error('Error loading property types: Payload is null or response is invalid');
        }
      },
      error => console.error('Error loading property types', error)
    );
  }

  loadGovernorates(): void {
    this.propertiesService.getRegions().subscribe(
      (response: GeneralResponse<Region[]>) => {
        if (response && response.payload) {
          this.governorates = response.payload;
        } else {
          this.governorates = [];
          console.error('Error loading governorates: Payload is null or response is invalid');
        }
      },
      error => console.error('Error loading governorates', error)
    );
  }

  loadFeatures(): void {
    // TODO: Implement feature loading - no service method available yet
    // this.propertiesService.getFeatures().subscribe(
    //   features => this.allFeatures = features,
    //   error => console.error('Error loading features', error)
    // );
    this.featuresService.getAll().pipe(
      handleResponse(),
      catchError(err => {
        console.error('Full error:', err);
        // return throwError(err);
        return of([]);
      })
    ).subscribe({
      next: (res) => {
        if(res){
          this.allFeatures = res;
          this.filteredFeatures = [...res]; // Initialize filtered list
        }
      },
      error: (err) => {
        if(err){
          console.error('Full error:', err);
        }
      },
      complete: () => {
        // this.errorMessage =null;
      }
    });
  }

  loadAmenities(): void {
    // TODO: Implement amenity loading - no service method available yet
    // this.propertiesService.getAmenities().subscribe(
    //   amenities => this.allAmenities = amenities,
    //   error => console.error('Error loading amenities', error)
    // );
    this.amenitiesService.getAll().pipe(
      handleResponse(),
      catchError(err => {
        console.error('Full error:', err);
        // return throwError(err);
        return of([]);
      })
    ).subscribe({
      next: (res) => {
        if(res){
          this.allAmenities = res;
        }
      },
      error: (err) => {
        if(err){
          console.error('Full error:', err);
        }
      },
      complete: () => {
        // this.errorMessage =null;
      }
    });
  }

  nextStep(): void {
    if (this.currentStep < 4 && this.isCurrentStepValid()) {
      this.currentStep++;
    }
  }

  prevStep(): void {
    if (this.currentStep > 1) {
      this.currentStep--;
    }
  }

  isCurrentStepValid(): boolean {
    switch (this.currentStep) {
      case 1:
        return !!(
          this.form.get('title')?.valid &&
          this.form.get('description')?.valid &&
          this.form.get('propertyTypeId')?.valid &&
          this.form.get('governorateId')?.valid &&
          this.form.get('mainImage')?.valid
        );
      case 2:
        return !!(
          this.form.get('price')?.valid &&
          this.form.get('area')?.valid &&
          this.form.get('latitude')?.valid &&
          this.form.get('longitude')?.valid
        );
      case 3:
        return true; // Features and amenities are optional
      default:
        return true;
    }
  }

  onMainImageChange(event: any): void {
    if (event.target.files.length > 0) {
      const file = event.target.files[0];
      this.form.patchValue({
        mainImage: file
      });
    }
  }

  onAdditionalImagesChange(event: any): void {
    if (event.target.files.length > 0) {
      const files = Array.from(event.target.files);
      const currentPhotos = this.form.get('photoUrls')?.value || [];
      this.form.patchValue({
        photoUrls: [...currentPhotos, ...files]
      });
    }
  }

  removeAdditionalImage(index: number): void {
    const photos = this.form.get('photoUrls')?.value;
    photos.splice(index, 1);
    this.form.patchValue({
      photoUrls: photos
    });
  }

  onVideoChange(event: any): void {
    if (event.target.files.length > 0) {
      const file = event.target.files[0];
      this.form.patchValue({
        videoUrl: file
      });
    }
  }

  onFeatureToggle(featureId: string, event: any): void {
    if (event.target.checked) {
      if (!this.selectedFeatures.includes(featureId)) {
        this.selectedFeatures.push(featureId);
      }
    } else {
      this.selectedFeatures = this.selectedFeatures.filter(id => id !== featureId);
    }
  }

  filterFeatures(): void {
    if (!this.featureSearchQuery) {
      this.filteredFeatures = [...this.allFeatures];
      return;
    }
    const query = this.featureSearchQuery.toLowerCase();
    this.filteredFeatures = this.allFeatures.filter(feature =>
      feature.name.toLowerCase().includes(query)
    );
  }

  clearFeatureSearch(): void {
    this.featureSearchQuery = '';
    this.filterFeatures();
  }

  toggleFeatureSelection(feature: Feature): void {
    const index = this.selectedFeatures.indexOf(feature.id);
    if (index === -1) {
      this.selectedFeatures.push(feature.id);
    } else {
      this.selectedFeatures.splice(index, 1);
    }
  }

  isFeatureSelected(featureId: string): boolean {
    return this.selectedFeatures.includes(featureId);
  }



  // removeFeature(featureId: string): void {
  //   this.selectedFeatures = this.selectedFeatures.filter(id => id !== featureId);
  // }

  // getFeatureName(featureId: string): string {
  //   const feature = this.allFeatures.find(f => f.id === featureId);
  //   return feature ? feature.name : '';
  // }

  removeSelectedFeature(featureId: string): void {
    this.selectedFeatures = this.selectedFeatures.filter(id => id !== featureId);
  }

  getFeatureName(featureId: string): string {
    const feature = this.allFeatures.find(f => f.id === featureId);
    return feature ? feature.name : 'Unknown Feature';
  }

  onAmenityToggle(amenityId: string, event: any): void {
    if (event.target.checked) {
      if (!this.selectedAmenities.includes(amenityId)) {
        this.selectedAmenities.push(amenityId);
      }
    } else {
      this.selectedAmenities = this.selectedAmenities.filter(id => id !== amenityId);
    }
  }

  isAmenitySelected(amenityId: string): boolean {
    return this.selectedAmenities.includes(amenityId);
  }

  removeAmenity(amenityId: string): void {
    this.selectedAmenities = this.selectedAmenities.filter(id => id !== amenityId);
  }

  getAmenityName(amenityId: string): string {
    const amenity = this.allAmenities.find(a => a.id === amenityId);
    return amenity ? amenity.name : '';
  }

  addNearbyPlace(): void {
    if (this.newNearbyPlace.trim()) {
      this.nearbyPlaces.push(this.newNearbyPlace.trim());
      this.newNearbyPlace = '';
    }
  }

  removeNearbyPlace(index: number): void {
    this.nearbyPlaces.splice(index, 1);
  }

  getPropertyTypeName(id: string): string {
    const type = this.propertyTypes.find(t => t.id === id);
    return type ? type.name : '';
  }

  getGovernorateName(id: string): string {
    const gov = this.governorates.find(g => g.id === id);
    return gov ? gov.name : '';
  }

  getImagePreview(file: File): string {
    // Return preview URL for image files
    if (file instanceof File) {
      return URL.createObjectURL(file);
    }
    return '';
  }

  removeMainImage(): void {
    this.form.patchValue({ mainImage: null });
    // If you need to clear the file input as well
    const fileInput = document.getElementById('mainImageInput') as HTMLInputElement;
    if (fileInput) {
      fileInput.value = '';
    }
  }

  // removeAdditionalImage(index: number): void {
  //   const currentPhotos = [...this.form.get('photoUrls')?.value];
  //   currentPhotos.splice(index, 1);
  //   this.form.patchValue({ photoUrls: currentPhotos });
  // }

  // Don't forget to revoke object URLs when component is destroyed
  ngOnDestroy(): void {
    // Revoke all image preview URLs to prevent memory leaks
    if (this.form.get('mainImage')?.value) {
      URL.revokeObjectURL(this.getImagePreview(this.form.get('mainImage')?.value));
    }

    this.form.get('photoUrls')?.value?.forEach((image: File) => {
      URL.revokeObjectURL(this.getImagePreview(image));
    });
  }

  onSubmit(): void {
    if (this.form.valid) {
      this.loading = true;

      const formData = new FormData();
      formData.append('title', this.form.value.title);
      formData.append('description', this.form.value.description);
      formData.append('propertyTypeId', this.form.value.propertyTypeId);
      formData.append('governorateId', this.form.value.governorateId);
      formData.append('mainImage', this.form.value.mainImage);

      if (this.form.value.photoUrls) {
        this.form.value.photoUrls.forEach((file: File) => {
          formData.append('photoUrls', file);
        });
      }

      if (this.form.value.videoUrl) {
        formData.append('videoUrl', this.form.value.videoUrl);
      }

      formData.append('price', this.form.value.price.toString());
      formData.append('insurancePayment', this.form.value.insurancePayment.toString());
      formData.append('area', this.form.value.area.toString());
      formData.append('rooms', this.form.value.rooms.toString());
      formData.append('status', this.form.value.status);
      formData.append('ownerId', this.form.value.ownerId);
      formData.append('paymentType', this.form.value.paymentType);
      formData.append('address', this.form.value.address);
      formData.append('latitude', this.form.value.latitude.toString());
      formData.append('longitude', this.form.value.longitude.toString());

      // Add arrays
      this.selectedFeatures.forEach(f => formData.append('features', f));
      this.selectedAmenities.forEach(a => formData.append('amenities', a));
      this.nearbyPlaces.forEach(p => formData.append('nearbyPlaces', p));

      this.propertiesService.createProperty(formData).subscribe(
        () => {
          this.submitted = true;
          this.loading = false;
        },
        error => {
          console.error('Error creating property', error);
          this.loading = false;
        }
      );
    }
  }

  resetForm(): void {
    this.currentStep = 1;
    this.submitted = false;
    this.form.reset({
      status: 'ForSale',
      price: 0,
      insurancePayment: 0,
      area: 0,
      rooms: 0,
      latitude: 0,
      longitude: 0
    });
    this.selectedFeatures = [];
    this.selectedAmenities = [];
    this.nearbyPlaces = [];
  }
}
