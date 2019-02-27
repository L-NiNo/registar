import { Component, OnInit } from '@angular/core';
import { PlayerService } from './services/player/player.service';
import { setTheme } from 'ngx-bootstrap/utils';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent implements OnInit {
  public player;
  public view;
  

  constructor(private ps: PlayerService) { 
  	 setTheme('bs4');
  	this.ps.player.subscribe( data => {
  		if(data) this.player = data;
  		if(this.player) console.log(this.player);
  	});
  	this.ps.view.subscribe( data => {
  		if(data) this.view = data;
  		if(this.view) console.log(this.view);
  	});
  }

  ngOnInit(){
	  let player = {
	  	status: undefined,
	  	nationalId:'',
	  	id:'',
	  	fname:'',
	  	lname:'',
	  	email: '',
	  	address: {},
	  	dob:{ day: null, month: null, year: null},
	  	school:null,
	  	grade: null,
	  	year:'',
	  	emergancyInfo: {},
	  	consents:{},
	  	medical:{},
	  	gaurdian:{}
	  };
	  this.ps.changePlayer(player);
	  // console.log(this);
  }

}
