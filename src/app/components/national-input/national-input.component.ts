import { Component, OnInit } from '@angular/core';
import { PlayerService } from '../../services/player/player.service';
import { HttpClient } from '@angular/common/http';

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
	public loading: boolean = false;
	private returningPlayerHeader = "Enter your National Lacrosse ID Number: ";
  private newPlayerHeader = "Enter your National Lacrosse ID Number: ";

  constructor(private http: HttpClient, private ps: PlayerService) {
    this.ps.player.subscribe(data => {
  		if(data) this.player = data;
  		this.header = (this.player && this.player.status == 'RETURN')?this.returningPlayerHeader:(this.player && this.player.status == 'NEW')?this.newPlayerHeader:'';
  	});
  	this.ps.view.subscribe( data => {
      if(data) this.view = data;
      // if(this.view) console.log(this.view);
    });
  }

  ngOnInit() {
  } 

  lookUp(){
  	if(!this.player || this.player.status == 'NEW') return this.ps.changeView('PI');;
  	if(!this.player.nationalId || this.player.nationalId == "") return;
  	this.loading = true;
    let data = { player: this.player.nationalId };
    this.http.post('/php/player.php', data)
    	.subscribe( 
    		data => {
      			console.log("success", data);
      			this.loading = false;
      			this.ps.changeView('CHALLENGE');
    		},
    		error => {
      			console.log("error");
      			this.loading = false;
      		}
      	);
  }

}
