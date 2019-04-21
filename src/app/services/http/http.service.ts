import { Injectable } from '@angular/core';
import { throwError as observableThrowError, Observable } from 'rxjs';
import { catchError, map } from 'rxjs/operators';
import { HttpClient } from "@angular/common/http";
import { BaseResponse } from '../../classes/BaseResponse'
@Injectable({
  providedIn: 'root'
})
export class HttpService {

  constructor(
    private http: HttpClient
  ) { 

  }

  get(url): Observable<BaseResponse> {
    return this.http
      .get<BaseResponse>(url).pipe(
        map(data => this.processHttp(data)),
        catchError(this.handleError));
  }

  post(url, bodyData) {
    return this.http
      .post<BaseResponse>(url, bodyData).pipe(
        map(data => this.processHttp(data)),
        catchError(this.handleError));
  }

  put(url, bodyData) {
    return this.http
      .put<BaseResponse>(url, bodyData).pipe(
        map(data => this.processHttp(data)),
        catchError(this.handleError));
  }

  delete(url) {
    return this.http
      .delete<BaseResponse>(url).pipe(
        map(data => this.processHttp(data)),
        catchError(this.handleError));
  }

  public handleError(error) {
    // console.log("HTTP ERROR: ", error);
    return observableThrowError(error);
  }

  public processHttp(response: BaseResponse) {
    if (response.error) return this.handleError(response.messages);
    return response.data;
  }
}
