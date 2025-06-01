import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environment';
import { LoginResponse } from '../../models/AuthenticationResponse';

@Injectable({
  providedIn: 'root'
})
export class UsersService {
  private baseURL: string = environment.baseURL;
  // public isAuthenticated: boolean =false;
  public isAgent: boolean = false;
  public currentUser: string | null ="";
  public accessToken: string | null = null;
  public userId: string | null = null;
  public userProfile: object | null = null;

  constructor(private http: HttpClient) {
    // this.isAuthenticated = !!localStorage.getItem('accessToken');
    const isUserTypeValue = localStorage.getItem('userType');
    this.isAgent = isUserTypeValue !=null && isUserTypeValue !== undefined && isUserTypeValue.toLowerCase() === 'agent';
    this.currentUser = localStorage.getItem('userName');
    this.userId = localStorage.getItem('userId');
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
    localStorage.removeItem('userId');
    this.accessToken = null;
    this.isAuthenticated();
    this.isAgent = false;
    this.currentUser = null;
  }

  register(formData:FormData): Observable<any> {
    const url = `${this.baseURL}app/user-account/register`;

    if (!formData) {
      throw new Error('Form data is required for registration.');
    }
    return this.http.post<any>(url, formData);
  }

  setAuthStatus(isAuth: boolean, userType: string, userName: string, accessToken?: string): void {
    // this.isAuthenticated = isAuthenticated;
    this.isAgent = userType.toLowerCase() === 'agent';
    this.currentUser = userName;

    if (isAuth) {
       if (!accessToken) {
        throw new Error('Access token is required when authenticating');
      }
      localStorage.setItem('accessToken', accessToken); // Replace with actual token
      localStorage.setItem('userType', userType);
      localStorage.setItem('userName', userName);
      localStorage.setItem('userId', this.userId || ''); // Ensure userId is set if available
    } else {
      this.logout();
    }
  }

  getCurrentUserProfile(): Observable<any> {
    const url = `${this.baseURL}app/user-account/user-profile/${this.userId}`;
    return this.http.get<any>(url);
  }

  updateProfile(formData: FormData): Observable<any> {
    const url = `${this.baseURL}app/user-account`;
    return this.http.put<any>(url, formData);
  }

  private isTokenExpired(token: string): boolean {
    try {
      const payload = JSON.parse(atob(token.split('.')[1]));
      const expirationTime = payload.exp * 1000; // Convert to milliseconds
      // console.log('Token expiration time:', new Date(expirationTime));
      // console.log('Current time:', new Date(Date.now()));
      return Date.now() > expirationTime;
    } catch (error) {
      console.error('Error decoding token:', error);
      return true; // Assume expired if there's an error
    }
  }

  isAuthenticated(): boolean {
    const accessToken = localStorage.getItem('accessToken');


    if (!accessToken)      return false;

    const tokenExpired = this.isTokenExpired(accessToken);
    // console.log('Token expired:', tokenExpired);
    if (tokenExpired) {
      this.logout();
      return false;
    }
    return true;
  }


}
