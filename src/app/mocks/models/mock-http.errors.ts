import {throwError as observableThrowError,  Observable } from 'rxjs';
import { HttpResponse } from '@angular/common/http';

export function e500(bodyObj){
    return observableThrowError(new HttpResponse({ status: 500, body: bodyObj }));
}

export function e404(){
    return observableThrowError(new HttpResponse({ status: 404 }));
}