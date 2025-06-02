import { Injectable } from '@angular/core';
import { BaseEntity } from '../../core/base/base.model';
import { environment } from '../../../environment';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { GeneralResponse } from '../../shared/utils/GeneralResponse';

@Injectable({
  providedIn: 'root'
})
export abstract class BaseService<T extends BaseEntity> {
  // @ts-ignore
  protected abstract baseUrl: environment.baseURL;

  protected constructor(protected http: HttpClient) { }

  getAll(): Observable<GeneralResponse<T[]>>{
    return this.http.get<GeneralResponse<T[]>>(this.baseUrl);
  }

  create(formData: FormData): Observable<GeneralResponse<T>> {
    console.log('this is create method')
    return this.http.post<GeneralResponse<T>>(this.baseUrl, formData);
  }

  update(formData: FormData): Observable<GeneralResponse<T>> {
    const id = formData.get('id');
    return this.http.put<GeneralResponse<T>>(`${this.baseUrl}/${id}`, formData);
  }

  delete(id: string): Observable<GeneralResponse<void>> {
    return this.http.delete<GeneralResponse<void>>(`${this.baseUrl}/${id}`);
  }
}
