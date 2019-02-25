import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { NationalInputComponent } from './national-input.component';

describe('NationalInputComponent', () => {
  let component: NationalInputComponent;
  let fixture: ComponentFixture<NationalInputComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NationalInputComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NationalInputComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
