import { Component, OnInit, Input, Output, ViewChild, EventEmitter } from '@angular/core';
import { ControlContainer, NgForm } from '@angular/forms';

@Component({
  selector: 'app-text',
  templateUrl: './text.component.html',
  styleUrls: ['./text.component.scss'],
  viewProviders:[{provide: ControlContainer, useExisting: NgForm}]
})
/*
* --- TEMPLATE DRIVEN APPROACH ----
* --- use w/ ngModel / ngForm ----
* --- parent form is async from html #form="ngForm"
*/

export class TextComponent implements OnInit {

	@Output() modelChange:EventEmitter<string> = new EventEmitter<string>();
	@Input() model; // Binding to parent variable
	@Input() name;
	@Input() id;
	@Input() type; // Needed for Formating and input Validation (added to class)
	@Input() max; // Optional
	@Input() min; // Optional
	@Input() required; // Optional
	@Input() pattern; // Optional
	@Input() placeholder; // Optional

	@Output() isBlurred:EventEmitter<boolean> = new EventEmitter<boolean>();

	@ViewChild('ctrl') control:any;

	public classes;
	public inputClass;
	public lostFocus = false;

  constructor() { }

	ngOnInit() {
  		this.classes = "form-control" + " "+ this.type;
  }

  onBlur() {
    	this.lostFocus = true;
    	this.isBlurred.emit(this.lostFocus);
    	this.errorCheck();
	}

	onFocus() {
		this.lostFocus = false;
	}

	errorCheck() {
		const ctrl = this.control;
		if (ctrl.invalid && (ctrl.dirty || ctrl.touched)) {
	 			this.inputClass = "has-error";
		} else if (ctrl.valid && (ctrl.dirty || ctrl.touched)) {
		  	this.inputClass = "has-success";
		} else {
		  	this.inputClass = null;
		}
	}

}
