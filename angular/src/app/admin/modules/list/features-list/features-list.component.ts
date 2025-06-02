import { Component, EventEmitter, Input, Output, OnInit } from '@angular/core';
import { Amenity } from '../../../../shared/models/amenity.model';
import { CommonModule } from '@angular/common';
import { Feature } from '../../../../shared/models/feature.model';

@Component({
  selector: 'app-features-list',
  imports: [CommonModule],
  templateUrl: './features-list.component.html',
  standalone: true,
  styleUrl: './features-list.component.css'
})
export class FeaturesListComponent {
  @Input() features: Feature[] = [];
  @Output() edit = new EventEmitter<Feature>();
  @Output() delete = new EventEmitter<string>();


 
  onDelete(){
    this.delete.emit()
  }
}
