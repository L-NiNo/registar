import { Component, OnInit, Input, Output, EventEmitter, ViewChild } from '@angular/core';
import { ControlContainer, NgForm } from '@angular/forms';


@Component({
  selector: 'consent-item',
  templateUrl: './consent-item.component.html',
  styleUrls: ['./consent-item.component.scss'],
  viewProviders:[{provide: ControlContainer, useExisting: NgForm}]
})
export class ConsentItemComponent implements OnInit {
  @Output() modelChange:EventEmitter<any> = new EventEmitter<any>();
  @Input() model; // Binding to parent variable
  @Input() header: string;
  @Input() title: string;
  @Input() ul: any[];
  @Input() ol: any[];
  @Input() text: string;
  @Input() link: string;
  @Input() name;
  @Input() required; //Optional
  marked = false;
  @ViewChild('ctrl') control:any;
  constructor() { }

  ngOnInit() {
  }

  toggleVisibility(e){
    this.marked= e.target.checked;
    this.modelChange.emit(e.target.checked);
  }
}
