import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environment';
import { LoginResponse } from './../models/AuthenticationResponse';

@Injectable({
  providedIn: 'root'
})
export class UsersService {
  private baseURL: string = environment.baseURL;
  public isAuthenticated: boolean =false;
  public isAgent: boolean = false;
  public currentUser: string | null ="";
  public accessToken: string | null = null;

  constructor(private http: HttpClient) {
    this.isAuthenticated = !!localStorage.getItem('accessToken');
    const isUserTypeValue = localStorage.getItem('userType');
    this.isAgent = isUserTypeValue !=null && isUserTypeValue !== undefined && isUserTypeValue.toLowerCase() === 'agent';
    this.currentUser = localStorage.getItem('userName');
  }

  login(email: string, password: string): Observable<LoginResponse> {
    const url = `${this.baseURL}app/user-account/login`;

    if (!email || !password) {
      throw new Error('Email and password are required for login.');
    }
    return this.http.post<LoginResponse>(url, { email, password });
  }

  logout(): void {
    localStorage.removeItem('accessToken');
    localStorage.removeItem('userType');
    localStorage.removeItem('userName');
    this.isAuthenticated = false;
    this.isAgent = false;
    this.currentUser = null;
  }

  register(email: string, password: string, userType: string): Observable<any> {
    const url = `${this.baseURL}app/user-account/register`;

    if (!email || !password || !userType) {
      throw new Error('Email, password, and user type are required for registration.');
    }
    return this.http.post<any>(url, { email, password, userType });
  }

  setAuthStatus(isAuthenticated: boolean, userType: string, userName: string, accessToken?: string): void {
    this.isAuthenticated = isAuthenticated;
    this.isAgent = userType.toLowerCase() === 'agent';
    this.currentUser = userName;

    if (isAuthenticated) {
       if (!accessToken) {
        throw new Error('Access token is required when authenticating');
      }
      localStorage.setItem('accessToken', accessToken); // Replace with actual token
      localStorage.setItem('userType', userType);
      localStorage.setItem('userName', userName);
    } else {
      this.logout();
    }
  }
}
