import { Component, OnInit } from '@angular/core';
import { HomeProperty } from '../models/HomeProperty.model';
import { PropertiesService } from '../services/properties.service';
import { handleResponse } from '../Utils/HandleResponse';
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

   payload= [
        {
            "id": "33f64b87-69d2-ec90-df6d-3a1a2ab0ce0f",
            "mainImage": "",
            "governorate": null
        },
        {
            "id": "30839e30-5e6c-4ebf-be46-3a1a2ab48b9a",
            "mainImage": "",
            "governorate": null
        },
        {
            "id": "91c5a7bd-4cd6-bd75-ea36-3a1a2ac0fb48",
            "mainImage": "",
            "governorate": null
        },
        {
            "id": "d2f25313-d4db-892f-9ee3-3a1a2af8083c",
            "mainImage": "",
            "governorate": null
        },
        {
            "id": "c061ef91-936d-b252-514f-3a1a2b034a6b",
            "mainImage": "https://localhost:44351/uploads/708d922e-57e5-46cf-a300-33ee70bbadfc_Screenshot 2025-05-21 134046.png",
            "governorate": null
        },
        {
            "id": "88bdd95e-54ed-bb33-7cdf-3a1a2dfcc4be",
            "mainImage": "https://localhost:44351/uploads/c55b167d-7edd-42b5-8d5f-f45e487298ce_Screenshot 2025-05-21 135936.png",
            "governorate": null
        },
        {
            "id": "e12e1b79-af98-2efb-14b6-3a1a2e0a1182",
            "mainImage": "https://localhost:44351/uploads/25f84dde-348d-4813-bff3-71ec098c9b55_1747129645286.jpg",
            "governorate": null
        },
        {
            "id": "c785fbd7-35b3-8059-56b6-3a1a2e0ad070",
            "mainImage": "https://localhost:44351/uploads/5ddd85b0-fca4-4c2c-b2fe-2fc2c82ecaf0_1747129645286.jpg",
            "governorate": null
        },
        {
            "id": "21113176-04aa-2c32-665b-3a1a2e0b6a29",
            "mainImage": "https://localhost:44351/uploads/f3b9ae2b-cc16-4d5c-8eb4-628cb0506faf_1747129645286.jpg",
            "governorate": null
        },
        {
            "id": "8a897c4c-8018-ccfc-94f2-3a1a2e25c1ee",
            "mainImage": "https://localhost:44351/uploads/f4ca1385-4498-475d-beee-1fe3458d216a_1747129645286.jpg",
            "governorate": null
        },
        {
            "id": "1f72497b-cdfe-c184-8ed9-3a1a2e2770ab",
            "mainImage": "https://localhost:44351/uploads/57acd72f-5305-4799-91e2-83ddce1d64ef_1747129645286.jpg",
            "governorate": null
        },
        {
            "id": "a96b39a6-8d01-5c55-ae96-3a1a2e2a4d88",
            "mainImage": "https://localhost:44351/uploads/ab60a292-5369-455a-ad73-67b3b9eea42e_Screenshot 2025-04-03 181509.png",
            "governorate": null
        },
        {
            "id": "0163dadf-a03a-e131-1480-3a1a2e38c644",
            "mainImage": "https://localhost:44351/uploads/7ac85837-69fe-452a-b6ca-d86f59e1801a_Screenshot 2025-04-03 181509.png",
            "governorate": null
        },
        {
            "id": "09ac9bf2-2ffb-c478-e882-3a1a2e3a62c9",
            "mainImage": "https://localhost:44351/uploads/74f21c6a-3eac-4da6-aee8-779a6ab4766e_Screenshot 2025-04-03 181509.png",
            "governorate": null
        },
        {
            "id": "37f178a1-4f99-b59f-6162-3a1a2e3d611c",
            "mainImage": "https://localhost:44351/uploads/31dd24f9-8e6c-432f-88a0-416223ad109a_Screenshot 2025-04-03 181509.png",
            "governorate": null
        },
        {
            "id": "616782f3-13bf-530e-0580-3a1a2e4168d2",
            "mainImage": "https://localhost:44351/uploads/8d3af417-9505-462f-83b4-58871736dc03_Screenshot 2025-04-03 181509.png",
            "governorate": null
        },
        {
            "id": "9c893d95-271c-55df-6bfe-3a1a2e432a60",
            "mainImage": "https://localhost:44351/uploads/a9b0d69e-d3f1-46ff-a2e8-b2ab24381154_Screenshot 2025-04-03 181509.png",
            "governorate": null
        }
    ]

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
    this.products = [];
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
          console.log()

          this.products = response;
        },
        error: (error) => {
          console.error('Error fetching home properties:', error);
        }
      });
  }

}
