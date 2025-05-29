import { Component, OnInit } from '@angular/core';
import { Form, FormBuilder, FormControl, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { UsersService } from '../../services/users.service';
import { CommonModule } from '@angular/common';
import { countries } from 'country-list-json';

@Component({
  selector: 'app-user-profile',
  imports: [ReactiveFormsModule, CommonModule],
  templateUrl: './user-profile.component.html',
  styleUrl: './user-profile.component.css'
})
export class UserProfileComponent implements OnInit {
  profileForm: FormGroup;
  selectedFile: File | null = null;
  isLoading: boolean = false;
  errorMessage: string | null = null;
  successMessage: string | null = null;
  countries: any[] = [];
  currentProfileImage: string | null = null;
  currentUser: object | null = null;
  currentUserValue: object | undefined;

  constructor(private fb: FormBuilder, private userService: UsersService) {
    this.profileForm = this.fb.group({
      username: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      phone: ['', [Validators.required, Validators.minLength(6)]],
      whatsapp: ['', [Validators.nullValidator, Validators.minLength(6)]],
      country: ['', Validators.required],
      companyName: ['', Validators.required],
      companyEmail: ['', [Validators.nullValidator, Validators.email]],
      department: ['', Validators.required],
      jobPosition: ['', Validators.required],
       password: ['',[Validators.nullValidator, Validators.minLength(6)]],
      rePassword: ['',[Validators.nullValidator, Validators.minLength(6)]],
    });
// console.log(this.currentUser)
    // this.currentUser = localStorage.getItem('currentUser') ? JSON.parse(localStorage.getItem('currentUser') || '{}') : null;

    this.countries = countries;
  }

  ngOnInit():void {
     this.loadUserProfile();
  }


  onUpdateProfile() {
    if (this.profileForm.invalid) return;

    const updatedProfile = this.profileForm.value;
    console.log('Submitting updated profile:', updatedProfile);

    // Call your API service to save the profile
    this.userService.updateProfile(updatedProfile).subscribe({
      next: (response) => {
        this.successMessage = 'Profile updated successfully!';
        this.errorMessage = '';
        console.log('Profile updated:', response);
      },

      error: (error) => {
        this.errorMessage = 'Failed to update profile. Please try again.';
        this.successMessage = '';
        console.error('Error updating profile:', error);
      }
    }
    );
  }

 loadUserProfile(): void {
    this.isLoading = true;
    this.userService.getCurrentUserProfile().subscribe({
      next: (profileData) => {
        const profile = profileData.payload;
        this.currentUser = profile;
        if (!profile) { return; }
        console.log('User profile loaded:', profile);
        this.isLoading = false;
        this.currentProfileImage = profile.profilePictureUrl;
        this.profileForm.patchValue({
          username: profile.userName,
          phone: profile.phone,
          whatsapp: profile.whatsapp,
          email: profile.email,
          country: profile.country,
          companyName: profile.companyName,
          companyEmail: profile.companyEmail,
          department: profile.department,
          jobPosition: profile.jobPosition
        });
      },
      error: (error) => {
        this.isLoading = false;
        this.errorMessage = 'Failed to load profile. Please try again.';
      }
    });
  }
  onFileSelected(event: any): void {
    const file = event.target.files[0];
    if (file) {
      this.selectedFile = file;
      // Preview the image
      const reader = new FileReader();
      reader.onload = (e: any) => {
        this.currentProfileImage = e.target.result;
      };
      reader.readAsDataURL(file);
    }
  }

  onSubmit(): void {
    // console.log('dsfsasgsag')
    // console.log('Form submitted:', this.profileForm.value);
    if (this.profileForm.invalid) {
      this.profileForm.markAllAsTouched();
      return;
    }

    // alert('Submitting profile update...');

    this.isLoading = true;
    this.errorMessage = null;
    this.successMessage = null;

    const formData = new FormData();
    const formValues = this.profileForm.value;

    Object.keys(formValues).forEach(key => {
      formData.append(key, formValues[key]);
    });

    if (this.selectedFile) {
      formData.append('profilePicture', this.selectedFile, this.selectedFile.name);
    }

    this.userService.updateProfile(formData).subscribe({
      next: (response: any) => {
        this.isLoading = false;
        if (response.error) {
          this.errorMessage = response.error.message || 'Update failed. Please try again.';
          return;
        }
        this.successMessage = 'Profile updated successfully!';
        // Optionally update the current user info
        if (response.data) {
          this.userService.setAuthStatus(
            true,
            response.data.userType || 'user',
            response.data.username,
            response.data.accessToken
          );
        }
      },
      error: (error: any) => {
        this.isLoading = false;
        this.errorMessage = error.error?.details || 'Update failed. Please try again.';
      }
    });
  }


  // Form control getters
  get usernameFormControl(): FormControl {
    return this.profileForm.get('username') as FormControl;
  }

  get emailFormControl(): FormControl {
    return this.profileForm.get('email') as FormControl;
  }

  get phoneFormControl(): FormControl {
    return this.profileForm.get('phone') as FormControl;
  }

  get whatsappFormControl(): FormControl {
    return this.profileForm.get('whatsapp') as FormControl;
  }

  get countryFormControl(): FormControl {
    return this.profileForm.get('country') as FormControl;
  }

  get companyNameFormControl(): FormControl {
    return this.profileForm.get('companyName') as FormControl;
  }

  get companyEmailFormControl(): FormControl {
    return this.profileForm.get('companyEmail') as FormControl;
  }

  get departmentFormControl(): FormControl {
    return this.profileForm.get('department') as FormControl;
  }

  get jobPositionFormControl(): FormControl {
    return this.profileForm.get('jobPosition') as FormControl;
  }

}
