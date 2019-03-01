import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable()
export class HeaderService {
  private _header = new BehaviorSubject<string>('');
	public header = this._header.asObservable();

  private newPlayerHeader = "Enter Player Information";
	private returningPlayerHeader = "Verify Player Information";

  constructor() { }

  changeHeader(value){
    this._header.next(this.getValueString(value));
  }

  private getValueString(value){
    switch(value){
      case 'RETURN': { return this.returningPlayerHeader; break }
      case 'NEW': { return this.newPlayerHeader; break }
      default : { return value; break}
    }
  }
}
