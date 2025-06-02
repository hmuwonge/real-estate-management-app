import { Component, OnInit, OnDestroy } from '@angular/core';
import { environment } from '../../../environment';
import { GoogleMapsModule } from '@angular/google-maps';

declare global {
  interface Window {
    initMap: () => void;
  }
}

@Component({
  selector: 'app-property-map',
  templateUrl: './property-map.component.html',
  styleUrls: ['./property-map.component.css'],
  imports: [GoogleMapsModule],
  standalone: true
})
export class PropertyMapComponent implements OnInit, OnDestroy {
  center: google.maps.LatLngLiteral = { lat: 0, lng: 0 };
  zoom = 12;
  markerPositions: google.maps.LatLngLiteral[] = [];
  userPosition?: google.maps.LatLngLiteral;
  apiLoaded = false;

  ngOnInit() {
    this.loadGoogleMaps();
  }

  ngOnDestroy() {
    // Clean up the global callback
    window.initMap = () => {};
  }

  onMapLoad() {
    this.apiLoaded = true;
    this.getUserLocation();
  }

  getUserLocation() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        (position) => {
          this.userPosition = {
            lat: position.coords.latitude,
            lng: position.coords.longitude
          };
          this.center = this.userPosition;
          this.loadNearbyProperties();
        },
        (error) => {
          console.error('Error getting location', error);
          this.center = { lat: 40.7128, lng: -74.0060 };
          this.loadNearbyProperties();
        }
      );
    } else {
      console.error('Geolocation not supported');
      this.center = { lat: 40.7128, lng: -74.0060 };
      this.loadNearbyProperties();
    }
  }

  loadNearbyProperties() {
    // This would typically be an API call to your backend
    // For demo, we'll add some dummy properties near the user
    if (this.userPosition) {
      // Add properties within ~0.1 degree (roughly 11km at equator)
      this.markerPositions = [
        {
          lat: this.userPosition.lat + 0.01,
          lng: this.userPosition.lng + 0.01
        },
        {
          lat: this.userPosition.lat - 0.01,
          lng: this.userPosition.lng + 0.02
        },
        {
          lat: this.userPosition.lat + 0.02,
          lng: this.userPosition.lng - 0.01
        }
      ];
    } else {
      // Default properties if no user location
      this.markerPositions = [
        { lat: 40.7128, lng: -74.0060 },
        { lat: 40.7228, lng: -74.0060 },
        { lat: 40.7128, lng: -74.0160 }
      ];
    }
  }

  loadGoogleMaps() {
    if (typeof google === 'undefined' || !google.maps) {
      window.initMap = () => this.onMapLoad();

      const script = document.createElement('script');
      script.src = `https://maps.googleapis.com/maps/api/js?key=${environment.googleMapsApiKey}&callback=initMap`;
      script.async = true;
      script.defer = true;
      script.onerror = () => {
        console.error('Google Maps script failed to load');
      };
      document.head.appendChild(script);
    } else {
      this.onMapLoad();
    }
  }
}
