import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ConsentItemComponent } from './consent-item.component';

describe('ConsentItemComponent', () => {
  let component: ConsentItemComponent;
  let fixture: ComponentFixture<ConsentItemComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ConsentItemComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ConsentItemComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
