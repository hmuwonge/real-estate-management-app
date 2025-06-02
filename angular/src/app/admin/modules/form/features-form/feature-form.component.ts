import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';
import { IconPickerModule } from 'ngx-icon-picker';
import { Feature } from '../../../../shared/models/feature.model';

@Component({
  selector: 'app-feature-form',
  imports: [CommonModule, IconPickerModule, ReactiveFormsModule, FormsModule],
  templateUrl: './feature-form.component.html',
  standalone: true,
  styleUrl: './feature-form.component.css'
})
export class FeatureFormComponent implements OnInit{
@Input() feature: Feature |null=null;
@Output() formSubmit = new EventEmitter<FormData>();
@Output() cancel = new EventEmitter<void>();

  iconSet = [
    { icon: 'wifi', name: 'WiFi' },
    { icon: 'pool', name: 'Swimming Pool' },
    { icon: 'local_dining', name: 'Restaurant' }
  ];

  form: FormGroup;

  constructor(private fb: FormBuilder) {
    this.form = this.fb.group({
      name: ['', [Validators.required, Validators.maxLength(50)]],
      icon: ['']
    });
  }

  ngOnInit() {
    if (this.feature) {
      this.form.patchValue(this.feature);
    }
  }

  onFileChange(event: Event) {
    const input = event.target as HTMLInputElement;
    if (input.files && input.files.length) {
      const file = input.files[0];
      this.form.patchValue({ icon: file });
    }
  }

  onSubmit() {
    if (this.form.valid) {
      const formData = new FormData();

      // Append all form values
      formData.append('name', this.form.get('name')?.value);
      formData.append('icon', this.form.get('icon')?.value);

      // Append file if exists
      const image = this.form.get('image')?.value;
      if (image) {
        formData.append('image', image);
      }

      // Append ID if editing
      if (this.feature?.id) {
        formData.append('id', this.feature.id);
      }

      this.formSubmit.emit(formData);
    }
  }

  onCancel() {
    this.cancel.emit();
  }
}
