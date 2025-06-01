import { Component, OnInit } from '@angular/core';
import { HomeProperty } from '../models/HomeProperty.model';
import { PropertiesService } from '../services/properties/properties.service';
import { handleResponse } from '../shared/utils/HandleResponse';
// import { CustomCarouselComponent } from "../components/custom-carousel/custom-carousel.component";
import { HomeCarouselComponent } from '../components/home-carousel/home-carousel.component';
import { HeaderCarouselComponent } from '../components/header-carousel/header-carousel.component';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [HomeCarouselComponent, HeaderCarouselComponent],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent implements OnInit {
  products: HomeProperty[] = [];
  searchString: string = '';


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


  constructor(private propertiesService: PropertiesService) {
    // Initialize products or fetch them from a service if needed
    // this.products = [];
  }
  ngOnInit(): void {
    //Called after the constructor, initializing input properties, and the first call to ngOnChanges.
    this.homeProperties();

    console.log('products data',this.products)
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

}
