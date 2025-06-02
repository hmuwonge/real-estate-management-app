import { Injectable } from '@angular/core';
import { Feature } from '../../shared/models/feature.model';
import { BaseService } from '../base/base.service';
import { environment } from '../../../environment';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class FeaturesService  extends BaseService<Feature>{
protected override baseUrl = `${environment.baseURL}app/property-feature`;
  constructor(http: HttpClient) {
    super(http)
  }

}