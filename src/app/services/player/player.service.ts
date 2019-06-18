import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { Player } from 'src/app/classes/Player';


@Injectable()
export class PlayerService {

	private _player = new BehaviorSubject<any>(null);
	private _view = new BehaviorSubject<any>('INIT');
	// private _view = new BehaviorSubject<any>('PI');
	private _editing = new BehaviorSubject<boolean>(false);
	private _challenge = new BehaviorSubject<any>(null);

	public player = this._player.asObservable();
	public view = this._view.asObservable();
	public etiting = this._view.asObservable();
	public challenge = this._challenge.asObservable();


	constructor() { }

	changePlayer(data: Player) {
		this._player.next(data);
	}

	changeView(data) {
		this._view.next(data);
	}

	changeEditing(data) {
		this._editing.next(data);
	}

	changeChallenge(data) {
		this._challenge.next(data);
	}


}
