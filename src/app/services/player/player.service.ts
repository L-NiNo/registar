import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';


@Injectable()
export class PlayerService {

	private _player = new BehaviorSubject<any>(null);
  // private _view = new BehaviorSubject<any>('CONSENT');
  private _view = new BehaviorSubject<any>('INIT');
	private _editing = new BehaviorSubject<boolean>(false);
	
	public player = this._player.asObservable();
  public view = this._view.asObservable();
	public etiting = this._view.asObservable();


  	constructor() { }

  	changePlayer(data){
  		this._player.next(data);
  	}

  	changeView(data){
      this._view.next(data);
    }

    changeEditing(data){
  		this._view.next(data);
  	}


}
