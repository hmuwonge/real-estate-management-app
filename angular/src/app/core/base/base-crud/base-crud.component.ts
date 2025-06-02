import { Component, OnInit } from '@angular/core';
import { BaseEntity } from '../base.model';
import { BaseService } from '../../../services/base/base.service';

@Component({
  selector: 'app-base-crud',
  imports: [],
  templateUrl: './base-crud.component.html',
  styleUrl: './base-crud.component.css'
})
export abstract class BaseCrudComponent<T extends BaseEntity> implements OnInit{
  entities: T[]=[];
  selectedEntity: T | null=null;
  isFormOpen=false;

  abstract loadEntities():void;

  // Declare abstract method that child components must implement
  protected abstract getService(): BaseService<T>;

  ngOnInit() {
    this.loadEntities()
  }

  onCreate(){
    this.selectedEntity=null;
    this.isFormOpen =true;
  }

  onEdit(entity: T) {
    this.selectedEntity = entity;
    this.isFormOpen = true;
  }

  onDelete(id: string) {
    this.entities = this.entities.filter(e => e.id !== id);

    // console.log(this.entities)
  }

  onSubmita(entity: T) {
    console.log('we are in base crud', entity)
    if (entity.id) {
      this.entities = this.entities.map(e => e.id === entity.id ? entity : e);
    } else {

      entity.id = Math.random().toString(36).substring(2);
      this.entities = [...this.entities, entity];
    }
    this.resetForm();
  }

  // base-crud.component.ts
  onSubmit(formData: FormData) {
    const service = this.getService();
    const id = formData.get('id');

    if (id) {
      service.update(formData).subscribe({
        next: (updated:any) => {
          this.entities = this.entities.map(e => e.id === updated.id ? updated : e);
          this.resetForm();
        }
      });
    } else {
      service.create(formData).subscribe({
        next: (created:any) => {
          this.entities = [...this.entities, created];
          this.resetForm();
        }
      });
    }
  }

  resetForm() {
    this.isFormOpen = false;
    this.selectedEntity = null;
  }

}
