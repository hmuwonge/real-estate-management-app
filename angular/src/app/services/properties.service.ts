import { Injectable } from '@angular/core';
import { environment } from '../../environment';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { GeneralResponse } from '../Utils/GeneralResponse';
import { HomeProperty } from '../models/HomeProperty.model';

@Injectable({
  providedIn: 'root'
})
export class PropertiesService {
  private baseURL: string = environment.baseURL;

  constructor(private http: HttpClient) { }

  getProperties(searchString:string): Observable<GeneralResponse<HomeProperty[]>> {
    const url = `${this.baseURL}app/public-properties/explore-home-property-list?searchString=${encodeURIComponent(searchString)}`;
    return this.http.get<any>(url);
  }
  getPropertyDetails(propertyId: string): Observable<GeneralResponse<HomeProperty>> {
    const url = `${this.baseURL}app/public-properties/${encodeURIComponent(propertyId)}/public-property`;
    return this.http.get<any>(url);
  }

  getHomeExploreProperties(): Observable<GeneralResponse<HomeProperty[]>> {
    const url = `${this.baseURL}app/public-properties/explore-home-property-list`;
    return this.http.get<any>(url);
  }
}
