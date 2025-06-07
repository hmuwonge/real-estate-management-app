import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { RouterOutlet, RouterLink, Router, ActivatedRoute } from '@angular/router';
import { FormGroup, FormControl, Validators, FormBuilder, ReactiveFormsModule } from '@angular/forms';
import { UsersService } from '../../services/users/users.service';
import { LoginResponse } from '../../models/AuthenticationResponse';
import { ToastrService } from 'ngx-toastr';

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
  errorMessage: string | null = null;
  returnUrl: string = '';


  constructor(private userService: UsersService,
    private toastr: ToastrService,
    private fb: FormBuilder, private router: Router, private route: ActivatedRoute) {


    this.loginForm = this.fb.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]]
    });

    this.returnUrl = this.route.snapshot.queryParams['returnUrl'] || '/';
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
        if (response.flag === false) {
          this.errorMessage = response.message || 'Login failed. Please check your credentials and try again.';
          // console.error('Login failed:', response.message);
          this.toastr.error(this.errorMessage, 'Login Error');
          return;
        }

        this.toastr.success('Login successful!', 'Success');
        this.userService.setAuthStatus(true, response.userData, response.accessToken);


        // if (this.userService.isAgent) {
        //   this.router.navigate(['/agent-dashboard']);
        // }
        // this.router.navigate(['/']);
        this.router.navigateByUrl(this.returnUrl);
      },
      error: (error) => {
        this.isLoading = false;
        this.errorMessage = error.error?.message || 'Login failed. Please check your credentials and try again.';
        // console.error('Login failed:', error);
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
