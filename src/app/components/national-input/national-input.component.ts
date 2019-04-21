import { Component, OnInit } from '@angular/core';
import { PlayerService } from '../../services/player/player.service';
import { HttpService } from 'src/app/services/http/http.service';

@Component({
	selector: 'app-national-input',
	templateUrl: './national-input.component.html',
	styleUrls: ['./national-input.component.scss']
})
export class NationalInputComponent implements OnInit {
	public player;
	public view;
	public header;
	public nationalId;
	public noPlayerFound = false;
	public loading: boolean = false;
	private returningPlayerHeader = "Enter your National Lacrosse ID Number: ";
	private newPlayerHeader = "Enter your National Lacrosse ID Number: ";

	constructor(private http: HttpService, private ps: PlayerService) {
		this.ps.player.subscribe(data => {
			if (data) this.player = data;
			this.header = (this.player && this.player.status == 'RETURN') ? this.returningPlayerHeader : (this.player && this.player.status == 'NEW') ? this.newPlayerHeader : '';
		});
		this.ps.view.subscribe(data => {
			if (data) this.view = data;
		});
	}

	ngOnInit() {
	}

	lookUp() {
		this.noPlayerFound = false;
		if (!this.player.nationalId || this.player.nationalId == "") return;
		this.loading = true;
		let data = { player: { id: this.player.nationalId } };
		this.lookupDataCall(data);
	}

	private playerNotFound() {
		this.loading = false;
		this.noPlayerFound = true;
	}

	private playerFound(data) {
		if (this.player.status === 'NEW')
			this.player.status = 'RETURN';
		this.loading = false;
		this.ps.changePlayer(this.player);
		this.ps.changeChallenge(data);
		this.ps.changeView('CHALLENGE');
	}

	private lookupDataCall(data) {
		return this.http.post('/api/lookup.php', data).toPromise()
			.then((data: any) => {
				console.log("success", data);
				if (!data && this.player.status !== 'NEW')
					return this.playerNotFound();
				else if (!data && this.player.status === 'NEW')
					return this.newReg();
				else
					return this.playerFound(data);
			})
			.catch(error => {
				console.log("error");
				this.loading = false;
			});
	}

	public newReg() {
		this.player.status = 'NEW';
		this.ps.changePlayer(this.player);
		this.ps.changeView('PI');
	}
}
