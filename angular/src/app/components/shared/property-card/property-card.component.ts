import { CommonModule, NgOptimizedImage } from '@angular/common';
import { Component, Input } from '@angular/core';
import { Router } from '@angular/router';
import { NG_ICON_DIRECTIVES, NgIcon, provideIcons } from '@ng-icons/core';
// import { featherAirplay,featherArrowRight } from '@ng-icons/feather-icons';
import { heroUsers, heroArrowRight } from '@ng-icons/heroicons/outline';

interface PropertyAddress {
  street: string;
  city: string;
  country: string;
}

interface Property {
  id: string;
  title: string;
  propertyType: string;
  price: number;
  governorate: String;
  bedrooms?: number;
  bathrooms?: number;
  mainImage?: string;
  isFeatured?: boolean;
  address?:PropertyAddress
}
@Component({
  selector: 'app-property-card',
  imports: [CommonModule,  NG_ICON_DIRECTIVES],
  templateUrl: './property-card.component.html',
  standalone: true,
  styleUrl: './property-card.component.css',
  providers: [provideIcons({ heroArrowRight, heroUsers })],
})
export class PropertyCardComponent {
@Input() property!: Property;

  constructor(private router: Router) {}

  // navigateToDetails(event?: Event): void {
  //   console.log('ghghghghg')
  //   if (event) {
  //     event.stopPropagation();
  //   }
  //   this.router.navigate(['/properties', this.property.id]);
  // }

  navigateToDetails(property: Property) {
    this.router.navigate(['/property', property.id]);
  }
}
