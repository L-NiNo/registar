import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { PlayerService } from '../../services/player/player.service';

@Component({
  selector: 'app-challenge',
  templateUrl: './challenge.component.html',
  styleUrls: ['./challenge.component.scss']
})
export class ChallengeComponent implements OnInit {
	public name;
	public email;
	public loading = false;
	public player;
	public view;
	public header;
  constructor(private http: HttpClient, private ps: PlayerService) {
  	this.ps.player.subscribe(data => {
  		if(data) this.player = data;
  		this.header = 'Verify Player Information';
  	});
  	this.ps.view.subscribe( data => {
      if(data) this.view = data;
      // if(this.view) console.log(this.view);
    });
   }

	ngOnInit() {
	}

	submit(){
		this.loading = true;
		let data = { player: this.player.nationalId, lname: this.name, email: this.email };
    	this.http.post('/php/challenge.php', data).subscribe( 
    		(data:any) => {
      			console.log("success", data);
      			this.loading = false;
      			this.ps.changePlayer(data.player);
      			this.ps.changeView('REVIEW');
    		},
    		error => {
      			console.log("error");
      			this.loading = false;
      		}
      	);
	}
  	

}
