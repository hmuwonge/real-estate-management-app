import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RentPropertiesComponent } from './rent-properties.component';

describe('RentPropertiesComponent', () => {
  let component: RentPropertiesComponent;
  let fixture: ComponentFixture<RentPropertiesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [RentPropertiesComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RentPropertiesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
