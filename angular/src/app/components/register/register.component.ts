import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, Validators,ReactiveFormsModule, FormControl } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { UsersService } from '../../services/users/users.service';
import { countries } from 'country-list-json';
@Component({
  selector: 'app-register',
  standalone:true,
  imports: [RouterLink,ReactiveFormsModule,CommonModule],
  templateUrl: './register.component.html',
  styleUrl: './register.component.css'
})
export class RegisterComponent {
  registrationForm: FormGroup;
selectedFile: File | null=null;
isLoading: boolean = false;
errorMessage: string | null =null;
countries: any[]=[];

constructor(private fb:FormBuilder,private userService:UsersService,
  private router:Router){
  this.registrationForm=this.fb.group({
    username: ['', Validators.required],
    phone: ['', Validators.required],
    password: ['', Validators.required],
    whatsapp: ['', Validators.required],
    rePassword: ['', Validators.required],
    email: ['', [Validators.required, Validators.email]],
    country: ['', Validators.required],
    companyName: ['', Validators.required],
    companyEmail: ['', [Validators.required, Validators.email]],
    department: ['', Validators.required],
    jobPosition: ['', Validators.required]

  });

  this.countries=countries;

  this.registrationForm.get('country')?.setValue(countries[0].name);
}

onFileSelected(event:any):void{
  const file=event.target.files[0];
  console.log(file);
  if(file){
    this.selectedFile=file;
  }
}

onSubmit(): void {
  if (this.registrationForm.invalid || !this.selectedFile) {
    this.registrationForm.markAllAsTouched();
    return;
  }

  this.isLoading=true;
  this.errorMessage=null;

  const {username,
    phone,password,
    whatsapp,
    rePassword,
    email,country,
    companyName,companyEmail,department,
    jobPosition}=this.registrationForm.value;

  if(password!==rePassword){
    this.errorMessage='Passwords do not match.';
    this.isLoading=false;
    return;
  }

  // console.log(this.registrationForm.value);

  const formData=new FormData();
  formData.append('username',username);
  formData.append('phone',phone);
  formData.append('password',password);
  formData.append('confirmPassword',rePassword);
  formData.append('whatsapp',whatsapp);
  formData.append('email',email);
  formData.append('country',country);
  formData.append('companyName',companyName);
  formData.append('companyEmail',companyEmail);
  formData.append('department',department);
  formData.append('jobPosition',jobPosition);
  formData.append('profilePicture',this.selectedFile,this.selectedFile?.name);

  console.log(formData.getAll);

  this.userService.register(formData).subscribe({
    next:(response:any)=>{
      this.isLoading=false;
      // console.log('Registration successful:',response);
      // this.router.navigate(['/auth/login']);

      if(response.error)
      {
        this.errorMessage=response.error.message||'Registration failed. Please try again.';
        return;
      }

      this.router.navigate(['/auth/login']);
    },
    error:(error:any)=>{
      this.isLoading=false;
      this.errorMessage=error.error?.details||'Registration failed. Please try again.';
      console.error('Registration failed:',error.error?.message || error);
    }
  })
}

get usernameFormControl(): FormControl {
  return this.registrationForm.get('username') as FormControl;
}

get passwordFormControl(): FormControl {
  return this.registrationForm.get('password') as FormControl;
}

get rePasswordFormControl(): FormControl {
  return this.registrationForm.get('rePassword') as FormControl;
}

get emailFormControl(): FormControl {
  return this.registrationForm.get('email') as FormControl;
}

get phoneFormControl(): FormControl {
  return this.registrationForm.get('phone') as FormControl;
}

get whatsappFormControl(): FormControl {
  return this.registrationForm.get('whatsapp') as FormControl;
}

get countryFormControl(): FormControl {
  return this.registrationForm.get('country') as FormControl;
}

get companyNameFormControl(): FormControl {
  return this.registrationForm.get('companyName') as FormControl;
}

get companyEmailFormControl(): FormControl {
  return this.registrationForm.get('companyEmail') as FormControl;
}

get departmentFormControl(): FormControl {
  return this.registrationForm.get('department') as FormControl;
}

get jobPositionFormControl(): FormControl {
  return this.registrationForm.get('jobPosition') as FormControl;
}

}
