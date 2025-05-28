import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { RouterOutlet,RouterLink, Router } from '@angular/router';
import { FormGroup, FormControl, Validators, FormBuilder,ReactiveFormsModule  } from '@angular/forms';
import { UsersService } from '../../services/users.service';
import { LoginResponse } from '../../models/AuthenticationResponse';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [RouterLink, ReactiveFormsModule, CommonModule],
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent {
  loginForm: FormGroup;
  isLoading: boolean = false;
  errorMessage: string | null =null;


  constructor(private userService: UsersService,
     private fb: FormBuilder,private router:Router) {
    this.loginForm = this.fb.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]]
    });
  }



login(event: Event): void {
  event.preventDefault();
  this.loginForm.markAllAsTouched();

  if (!this.loginForm.valid) {
    return;
  }

  this.isLoading = true;
  this.errorMessage = null;

  const { email, password } = this.loginForm.value;

  this.userService.login(email, password).subscribe({
    next: (response: LoginResponse) => {
      this.isLoading = false;
      console.log('Login successful:', response);
      if (response.flag === false) {
        this.errorMessage = response.message || 'Login failed. Please check your credentials and try again.';
        return;
      }

      this.userService.setAuthStatus(true, response.userData?.userType, response.userData?.userName,response.accessToken);

      // localStorage.setItem('accessToken', response.accessToken);
      // localStorage.setItem('userType', response.userData?.userType);
      // localStorage.setItem('userName', response.userData?.userName);
      // this.userService.isAuthenticated = true;
      // this.userService.isAgent = response.userData?.userType.toLowerCase() === 'Agent';
      // this.userService.currentUser = response.userData?.userName;

      if (this.userService.isAgent) {
        this.router.navigate(['/agent-dashboard']);
      }
      this.router.navigate(['/']);
    },
    error: (error) => {
      this.isLoading = false;
      this.errorMessage = error.error?.message || 'Login failed. Please check your credentials and try again.';
      console.error('Login failed:', error);
    }
  });
}


  get passwordFormControl(): FormControl {
    return this.loginForm.get('password') as FormControl;
  }

  get emailFormControl(): FormControl {
    return this.loginForm.get('email') as FormControl;
  }

}
