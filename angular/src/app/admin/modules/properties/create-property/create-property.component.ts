import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import {
  AbstractControl,
  FormArray,
  FormBuilder,
  FormControl,
  FormGroup,
  ReactiveFormsModule,
  Validators
} from '@angular/forms';

@Component({
  selector: 'app-create-property',
  imports: [CommonModule,ReactiveFormsModule],
  templateUrl: './create-property.component.html',
  standalone: true,
  styleUrl: './create-property.component.css'
})
export class CreatePropertyComponent {
  currentStep = 1;
  form: FormGroup;
  submitted = false;
  loading = false;
  steps = [
    { number: 1, title: 'Info & Images' },
    { number: 2, title: 'Services' },
    { number: 3, title: 'Price & Location' },
    { number: 4, title: 'Your Plan' }
  ];

  constructor(private fb: FormBuilder) {
    this.form = this.fb.group({
      // Step 1: Info & Images
      propertyName: ['', Validators.required],
      description: ['', Validators.required],
      price: ['', [Validators.required, Validators.pattern(/^\d+$/)]],
      bedrooms: ['', Validators.required],
      bathrooms: ['', Validators.required],
      area: ['', Validators.required],
      address: ['', Validators.required],
      images: [[]],

      // Step 2: Services
      services: this.fb.group({
        wifi: [false],
        parking: [false],
        airConditioning: [false],
        heating: [false],
        pool: [false],
        laundry: [false]
      }),

      unitFacilities: this.fb.group({
        description: [''],
        facilities: this.fb.array([
          this.fb.control('')
        ]),
        newFacilities: ['']
      }),

      featuresTags: this.fb.array([
        this.fb.control('')
      ]),

      videoTour: [null],

      // Step 3: Price & Location
      priceEstimate: [''],
      monthlyPayment: [''],
      locationDetails: [''],

      // Step 4: Your Plan
      plan: ['basic', Validators.required],
      terms: [false, Validators.requiredTrue]


    });
  }

  nextStep() {
    if (this.currentStep < 4) {
      this.currentStep++;
    }
  }

  prevStep() {
    if (this.currentStep > 1) {
      this.currentStep--;
    }
  }

  onFileChange(event: any) {
    if (event.target.files && event.target.files.length > 0) {
      const files = Array.from(event.target.files);
      this.form.patchValue({
        images: files
      });
    }
  }

  onSubmit() {
    if (this.form.valid) {
      this.loading = true;
      // Simulate API call
      setTimeout(() => {
        console.log('Form submitted:', this.form.value);
        this.submitted = true;
        this.loading = false;
      }, 1500);
    }
  }

   deleteImage(image: any) {
    // this.property.images = this.property.images.filter(img => img !== image);
  }

  // In your component
  getFormControl(control: AbstractControl): FormControl {
    return control as FormControl;
  }

  get step1Controls() {
    return this.form.controls;
  }

  get servicesControls() {
    return (this.form.get('services') as FormGroup).controls;
  }


  // Add these methods to your component class
  get unitDetails() {
    return (this.form.get('unitDetails') as FormGroup).controls;
  }

  get unitFacilities() {
    return (this.form.get('unitFacilities') as FormGroup).controls;
  }

  get facilities():FormArray {
    return (this.form.get('unitFacilities.facilities') as FormArray);
  }

  get featuresTags():FormArray {
    return this.form.get('featuresTags') as FormArray;
  }

  addFacility() {
    this.facilities.push(this.fb.control(''));
  }

  removeFacility(index: number) {
    this.facilities.removeAt(index);
  }

  addTag() {
    if (this.featuresTags.length < 5) {
      this.featuresTags.push(this.fb.control(''));
    }
  }

  removeTag(index: number) {
    this.featuresTags.removeAt(index);
  }

  onVideoChange(event: any) {
    if (event.target.files.length > 0) {
      const file = event.target.files[0];
      this.form.patchValue({
        videoTour: file
      });
    }

  }
}
