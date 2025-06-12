import { CommonModule } from '@angular/common';
import { Component, Input, OnInit, SimpleChanges, OnChanges } from '@angular/core';

import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-image-slider',
  imports: [CommonModule],
  templateUrl: './image-slider.component.html',
  standalone: true,
  styleUrl: './image-slider.component.css'
})
export class ImageSliderComponent implements  OnChanges {
  @Input() images: string[] = [];

   isModalOpen = false;
  currentModalIndex = 0;

  selectedImage: string = '';//this.images[0];
  previewLimit = 3;


ngOnChanges(changes: SimpleChanges): void {
  //Called before any other lifecycle hook. Use it to inject dependencies, but avoid any serious work here.
  //Add '${implements OnChanges}' to the class.
  if (changes['images'] && changes['images'].currentValue) {
    this.images = changes['images'].currentValue;
    if (this.images.length > 0) {
      this.selectedImage = this.images[0];
    } else {
      this.selectedImage = '';
    }
  }
}

  selectImage(img: string) {
    this.selectedImage = img;
  }

  openModal(index: number) {
    this.currentModalIndex = index;
    this.isModalOpen = true;
  }

  closeModal() {
    this.isModalOpen = false;
  }

  nextImage() {
    this.currentModalIndex = (this.currentModalIndex + 1) % this.images.length;
  }

  prevImage() {
    this.currentModalIndex =
      (this.currentModalIndex - 1 + this.images.length) % this.images.length;
  }

}
