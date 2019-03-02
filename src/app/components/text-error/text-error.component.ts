import { Component, OnInit, Input } from "@angular/core";

interface Errors {
	[key: string]: any;
}
@Component({
  selector: 'app-text-error',
  templateUrl: './text-error.component.html',
  styleUrls: ['./text-error.component.scss']
})
export class TextErrorComponent implements OnInit {
    @Input() errors: Errors;
  	@Input() lostFocus: boolean;

  	minLength: string;

  	constructor() {}

    ngOnInit() {
    }

}
