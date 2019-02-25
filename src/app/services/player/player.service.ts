import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';


@Injectable()
export class PlayerService {

	private _player = new BehaviorSubject<any>(null);
	private _view = new BehaviorSubject<any>('INIT');
	
	public player = this._player.asObservable();
	public view = this._view.asObservable();


  	constructor() { }

  	changePlayer(data){
  		this._player.next(data);
  	}

  	changeView(data){
  		this._view.next(data);
  	}


}
