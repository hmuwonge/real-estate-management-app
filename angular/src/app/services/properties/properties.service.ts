import { Injectable } from '@angular/core';
import { environment } from '../../../environment';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { GeneralResponse } from '../../shared/utils/GeneralResponse';
import { HomeProperty } from '../../models/HomeProperty.model';
import { PropertyDetail } from '../../models/PropertyDetails.mode';
import { SimilarProperty } from '../../models/SimilarProperty.model';
import { PropertyType } from '../../shared/models/property.model';
import { Region } from '../../shared/models/region.model';

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

  // get BuyStatusProperties()
  getPropertyDetails(propertyId: string): Observable<GeneralResponse<PropertyDetail>> {
    const url = `${this.baseURL}app/public-properties/${encodeURIComponent(propertyId)}/public-property`;
    return this.http.get<any>(url);
  }

  getSimilarProperties(propertyId: string):Observable<GeneralResponse<SimilarProperty[]>>{
    const url =`${this.baseURL}app/property/similar-properties/${encodeURIComponent(propertyId)}?maxResults=4`;
    return this.http.get<any>(url);
  }


  getUserProperties(id:string):Observable<GeneralResponse<SimilarProperty[]>>{

    const url =`${this.baseURL}app/public-properties/public-property-list`   //property/${encodeURIComponent(id)}/user-list?maxResults=4`;
    return this.http.get<any>(url);
  }

  getHomeExploreProperties(): Observable<GeneralResponse<HomeProperty[]>> {
    const url = `${this.baseURL}app/public-properties/explore-home-property-list`;
    return this.http.get<any>(url);
  }

  getPropertiesBuyRent(filters: any): Observable<GeneralResponse<SimilarProperty[]>> {
    let params = new HttpParams();

    // Add filters to params
    if (filters.GovernorateId) params = params.append('GovernorateId', filters.GovernorateId);
    if (filters.type) params = params.append('propertyTypeId', filters.type);
    if (filters.status) params = params.append('status', filters.status);
    if (filters.minPrice) params = params.append('minPrice', filters.minPrice);
    if (filters.maxPrice) params = params.append('maxPrice', filters.maxPrice);
    if (filters.minArea) params = params.append('minArea', filters.minArea);
    if (filters.maxArea) params = params.append('maxArea', filters.maxArea);
    params = params.append('sortDescending', filters.sortDescending);

    return this.http.get<GeneralResponse<SimilarProperty[]>>(
      `${this.baseURL}app/public-properties/buy-rent?maxResults=10`,
      { params }
    );
  }

  getPropertyTypes(): Observable<GeneralResponse<PropertyType[]>> {
    return this.http.get<GeneralResponse<PropertyType[]>>(
      `${this.baseURL}app/property-type`
    );
  }

  getRegions(): Observable<GeneralResponse<Region[]>> {
    return this.http.get<GeneralResponse<Region[]>>(
      `${this.baseURL}app/governorates`
    );
  }

  createProperty(formData: FormData): Observable<GeneralResponse<any>> {
    return this.http.post<GeneralResponse<any>>(
      `${this.baseURL}app/property`,
      formData
    );
  }

}
