import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { PlayerService } from '../../services/player/player.service';
import { Birthdate } from 'src/app/classes/Birthdate';
import { RegexSettings } from '../../classes/regexes';
import { Player } from 'src/app/classes/Player';

@Component({
	selector: 'app-challenge',
	templateUrl: './challenge.component.html',
	styleUrls: ['./challenge.component.scss']
})
export class ChallengeComponent implements OnInit {
	public dob: Birthdate;
	public email;
	public loading = false;
	public player;
	public view;
	public header;
	public data;
	public error;
	public emailPatterm = RegexSettings.email.pattern.source;
	constructor(
		private http: HttpClient,
		private ps: PlayerService
	) {
		// this.dob = '01/20/2002';
		this.dob = new Birthdate(20, 1, 2002);
		this.email = 'xxx@xx.com';

		this.ps.player.subscribe(data => {
			if (data) this.player = data;
			this.header = 'Verify Player Information';
		});
		this.ps.view.subscribe(data => {
			if (data) this.view = data;
			// if(this.view) console.log(this.view);
		});
		this.ps.challenge.subscribe(data => {
			if (data) this.data = data;
		});
	}

	ngOnInit() {
	}

	submit() {
		this.loading = true;

		let data = { player: this.player.nationalId, dob: this.dob.birthday.replace(/\//g, '.'), email: this.email.toUpperCase() };
		this.http.post('/api/verify.php', data).subscribe(
			(response: any) => {
				console.log("success", response);
				this.loading = false;
				this.ps.changePlayer(Object.assign({}, this.player, response.data));
				this.ps.changeView('REVIEW');
			},
			error => {
				console.log("error");
				this.error = true;
				this.loading = false;
			}
		);
	}

	goBack() {
		this.ps.changePlayer(new Player());
		this.ps.changeChallenge(null);
		this.ps.changeView('INIT');
	}



}
