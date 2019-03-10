import { HttpRequest, HttpResponse, HttpEvent } from "@angular/common/http";
import { Observable } from "rxjs";

//MOCK ERROR
import { e500 } from "../models/mock-http.errors";

// import mock responses
import { LookupMock } from "../models/lookup.get";

const POST = "POST";
const GET = "GET";

export function backend(
    url: string,
    method: string,
    request: HttpRequest<any>
): Observable<HttpEvent<any>> {
    if (url.match(/^.*\/php\/player.php/) && method === POST) {
        return new Observable(resp => {
            resp.next(
                new HttpResponse({
                    status: 200,
                    body: LookupMock
                })
            );
            resp.complete();
        });
        //return e500(Session_US);
    }

    // if (url.match(/^.*\/pm\/api\/profile\/address*/) && method === GET) {
    //     return new Observable(resp => {
    //         resp.next(
    //             new HttpResponse({
    //                 status: 200,
    //                 body: AddressMock
    //             })
    //         );
    //         resp.complete();
    //     });
    //     //return e500(AddressMock);
    // }

    // NOTE: proxy should handle this
    // if (url.match(/^.*\/pci\/oc-cms-service\/*/) && method === GET) {
    //     let data = url.match(/^.*\/pci\/us\/*/) //looks for market us (only 1 lang currently)
    //         ? getCMSData("us", "en")
    //         : url.match(/^.*\/pci\/ca\/*/) //looks for market ca then checks for lang
    //         ? url.match(/^.*\/ca\/fr\?*/)
    //             ? getCMSData("ca", "fr")
    //             : getCMSData("ca", "en")
    //         : getCMSData("us", "en"); // failover is us/en -- add new here when needed
    //     return new Observable(resp => {
    //         resp.next(
    //             new HttpResponse({
    //                 status: 200,
    //                 body: data
    //             })
    //         );
    //         resp.complete();
    //     });
    //     //return e500(mockCms);
    // }
}