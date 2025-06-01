import { Component, EventEmitter, Input, Output } from '@angular/core';
import { Amenity } from '../../../../shared/models/amenity.model';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-amenities-list',
  imports: [CommonModule],
  templateUrl: './amenities-list.component.html',
  standalone: true,
  styleUrl: './amenities-list.component.css'
})
export class AmenitiesListComponent {
  @Input() amenities: Amenity[] = [];
  @Output() edit = new EventEmitter<Amenity>();
  @Output() delete = new EventEmitter<string>();
}
