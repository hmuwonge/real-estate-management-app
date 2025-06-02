import { Component, OnInit } from '@angular/core';
import { HomeProperty } from '../models/HomeProperty.model';
import { PropertiesService } from '../services/properties/properties.service';
import { handleResponse } from '../shared/utils/HandleResponse';
// import { CustomCarouselComponent } from "../components/custom-carousel/custom-carousel.component";
import { HomeCarouselComponent } from '../components/home-carousel/home-carousel.component';
import { HeaderCarouselComponent } from '../components/header-carousel/header-carousel.component';
import { FormBuilder, FormGroup, ReactiveFormsModule } from '@angular/forms';
import { PropertyType } from '../shared/models/type.mode';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [HomeCarouselComponent, HeaderCarouselComponent,CommonModule,ReactiveFormsModule],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent implements OnInit {
  products: HomeProperty[] = [];
   propertyTypes: PropertyType[] = [];
  searchString: string = '';

  searchForm: FormGroup;

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


     headerSlides= [
    {
        "mainImage": "../images/slide4.jpg",
        "title": "The Best Way to Buy or Rent Your Property",
        "subtitle": "With the most complete source of homes"
    },
    {
        "mainImage": "../images/slide3.jpg",
        "title": "The Best Way to Buy or Rent Your Property",
        "subtitle": "With the most complete source of homes"
    },
    {
        "mainImage": "../images/slide2.jpg",
        "title": "The Best Way to Buy or Rent Your Property",
        "subtitle": "With the most complete source of homes"
    },
    {
        "mainImage": "../images/slide1.jpg",
        "title": "The Best Way to Buy or Rent Your Property",
        "subtitle": "With the most complete source of homes"
    }
]


  constructor(private propertiesService: PropertiesService, private fb: FormBuilder,) {

    this.searchForm = this.fb.group({
      GovernorateId: [''],
      status: ['Sell'],
      type: [''],
      priceRange: [''],
      searchString: [''],
      minPrice: [''],
      maxPrice: ['']
    });
  }
  ngOnInit(): void {
    this.homeProperties();

    console.log('products data',this.products)
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

    }

  homeProperties() {
    this.propertiesService.getHomeExploreProperties().pipe(handleResponse<HomeProperty[]>())
      .subscribe({
        next: (response: HomeProperty[]) => {
          this.products = response;
        },
        error: (error) => {
          console.error('Error fetching home properties:', error);
        }
      });
  }

  searchProperties(): void {}

}
