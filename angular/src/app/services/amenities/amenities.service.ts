import { Injectable } from '@angular/core';
import { BaseService } from '../base/base.service';
import { HttpClient } from '@angular/common/http';
import { Amenity } from '../../shared/models/amenity.model';
import { environment } from '../../../environment';
import { Observable, tap } from 'rxjs';
import { handleResponse } from '../../shared/utils/HandleResponse';

@Injectable({
  providedIn: 'root'
})
export class AmenitiesService extends BaseService<Amenity>{
protected override baseUrl = `${environment.baseURL}app/amenity`;
  constructor(http: HttpClient) {
    super(http)
  }



}
