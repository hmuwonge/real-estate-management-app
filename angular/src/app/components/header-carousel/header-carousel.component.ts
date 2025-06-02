import { CommonModule } from '@angular/common';
import { Component, Input, OnInit, OnDestroy } from '@angular/core';
import { HeaderSlider } from '../../models/HeaderSlider.mode';

@Component({
  selector: 'app-header-carousel',
  imports: [CommonModule],
  templateUrl: './header-carousel.component.html',
  standalone: true,
  styleUrl: './header-carousel.component.css'
})
export class HeaderCarouselComponent implements OnInit, OnDestroy {
  @Input() items: HeaderSlider[] = [];
  @Input() itemsPerPage: number = 3;
  currentIndex: number = 0;
  private intervalId: any;

  ngOnInit() {
  this.startAutoRotation();
}

ngOnDestroy() {
  this.stopAutoRotation();
}

startAutoRotation() {
  this.intervalId = setInterval(() => {
    this.next();
  }, 5000); // Rotate every 5 seconds
}

stopAutoRotation() {
  if (this.intervalId) {
    clearInterval(this.intervalId);
  }
}

// Add these to pause on hover
onMouseEnter() {
  this.stopAutoRotation();
}

onMouseLeave() {
  this.startAutoRotation();
}

  next() {
    // this.currentIndex += this.itemsPerPage;
    // if (this.currentIndex >= this.cities.length) {
    //   this.currentIndex = 0; // Reset to the start if we exceed the length
    // }

    this.currentIndex = (this.currentIndex + this.itemsPerPage) % this.items.length;
  }

  prev() {
    this.currentIndex = (this.currentIndex - this.itemsPerPage + this.items.length) % this.items.length;
  }

  goTo(index: number) {
    // if (index >= 0 && index < this.cities.length) {
    //   this.currentIndex = index;
    // }
  this.currentIndex = index;

  }

}
