import { CommonModule } from '@angular/common';
import { Component, Input, OnInit, OnDestroy, HostListener } from '@angular/core';


interface CarouselItem {
  imageUrl: string;
  title: string;
  description: string;
}
@Component({
  selector: 'app-custom-carousel',
  imports: [CommonModule],
  templateUrl: './custom-carousel.component.html',
  styleUrl: './custom-carousel.component.css'
})

export class CustomCarouselComponent implements OnInit, OnDestroy {
  @Input() items: CarouselItem[] = [];
  @Input() itemsPerPage: number = 3;
  currentIndex: number = 0;
  private intervalId: any;
  private resizeObserver: ResizeObserver;
  visibleItems = 1;

  constructor() {
    this.updateVisibleItems();
    this.resizeObserver = new ResizeObserver(() => this.updateVisibleItems());
  }

  ngOnInit() {
    this.startAutoRotation();
  }

  @HostListener('window:resize')
  updateVisibleItems() {
    const width = window.innerWidth;

    if (width >= 1200) {
      this.visibleItems = 4;
    } else if (width >= 900) {
      this.visibleItems = 3;
    } else if (width >= 600) {
      this.visibleItems = 2
    } else {
      this.visibleItems = 1;
    }
  }

  ngOnDestroy() {
    this.stopAutoRotation();
  }

  startAutoRotation() {
    // this.intervalId = setInterval(() => {
    //   this.next();
    // }, 5000); // Rotate every 5 seconds
     this.stopAutoRotation();
    this.intervalId = setInterval(() => this.next(), 5000);
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
    if(this.currentIndex + this.visibleItems < this.items.length){
      this.currentIndex++;
    }else{
      this.currentIndex=0;
    }

    // this.currentIndex = (this.currentIndex + this.itemsPerPage) % this.items.length;
  }

  prev() {
    if (this.currentIndex > 0) {
      this.currentIndex--;
    } else {
      this.currentIndex = Math.max(0, this.items.length - this.visibleItems);
    }
    // this.currentIndex = (this.currentIndex - this.itemsPerPage + this.items.length) % this.items.length;
  }

  goTo(index: number) {
    // if (index >= 0 && index < this.cities.length) {
    //   this.currentIndex = index;
    // }
    // this.currentIndex = index;
     this.currentIndex = Math.min(index, this.items.length - this.visibleItems);

  }


  // Add to custom-carousel.component.ts
getIndicatorArray(): number[] {
  const count = Math.ceil(this.items.length / this.visibleItems);
  return Array(count).fill(0).map((x, i) => i);
}

isIndicatorActive(index: number): boolean {
  const start = index * this.visibleItems;
  const end = start + this.visibleItems;
  return this.currentIndex >= start && this.currentIndex < end;
}

// Touch support methods
private touchStartX = 0;

onTouchStart(e: TouchEvent) {
  this.touchStartX = e.touches[0].clientX;
  this.stopAutoRotation();
}

onTouchEnd(e: TouchEvent) {
  const touchEndX = e.changedTouches[0].clientX;
  const diff = this.touchStartX - touchEndX;

  if (diff > 50) { // Swipe left
    this.next();
  } else if (diff < -50) { // Swipe right
    this.prev();
  }

  this.startAutoRotation();
}

}
