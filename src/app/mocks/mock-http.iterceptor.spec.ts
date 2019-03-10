import { TestBed } from '@angular/core/testing';

import { MockHttp.IterceptorService } from './mock-http.iterceptor';

describe('MockHttp.IterceptorService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: MockHttp.IterceptorService = TestBed.get(MockHttp.IterceptorService);
    expect(service).toBeTruthy();
  });
});
