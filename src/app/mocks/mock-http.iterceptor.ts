import { Injectable } from '@angular/core';
import { HttpRequest, HttpHandler, HttpEvent, HttpInterceptor, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs';

import { e404 } from './models/mock-http.errors';
import { backend } from './api/backend';


@Injectable()
export class MockHttpInterceptor implements HttpInterceptor {

    constructor() { }

    intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
        const url: string = request.url;
        const method: string = request.method;

        // console.log("url = ", url);
        // console.log("method = ", method);
        
 		/* Add new api mock backend services to here */
        return backend(url, method, request) || 
        	next.handle(request); // No catch if URL isn't caught to allow proxy 
            // .catch(this.handleError); // use catch to see 404s request not handeled
    }

    private handleError(error){
        console.log("INTERCEPT ERROR: ", error);
        return e404();
    }


}