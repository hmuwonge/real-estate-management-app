import { CommonModule } from '@angular/common';
import { Component, Input } from '@angular/core';

import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-image-slider',
  imports: [CommonModule],
  templateUrl: './image-slider.component.html',
  standalone: true,
  styleUrl: './image-slider.component.css'
})
export class ImageSliderComponent {
  @Input() images: string[] = [];

   isModalOpen = false;
  currentModalIndex = 0;

  selectedImage: string = this.images[0];
  previewLimit = 3;

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
