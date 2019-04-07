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
  		// if(this.player) console.log(this.player);
  	});
  	this.ps.view.subscribe( data => {
  		if(data) this.view = data;
  		// if(this.view) console.log(this.view);
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
	  	emergency: { primary: {}, secondary: {}},
	  	consents:{
			  REP:false,
			LIABILITY:false,
			CONDUCT_LOCAL:false,
			CONDUCT_LEAGUE:false,
			FEES:false,
			IMAGE:false
		},
	  	medical:{},
	  	guardian:{ primary: {}, secondary: {}}
	  };
	  let player2 = {
	  	status: undefined,
	  	nationalId:'',
	  	id:'',
	  	fname:'Jon',
	  	lname:'Doe',
	  	email: 'xxx@xx.com',
	  	address: {
	  		street1:'1230 St ln',
	  		street2:'apt 130',
	  		city:'Austin',
	  		state:'Texas',
	  		zip:'78737'
	  	},
	  	dob:{ 
	  		day: 9, 
	  		month: 12, 
	  		year: 2002,
	  		string:'12/09/2002'
	  	},
	  	school:'DSHS',
	  	grade: 9,
	  	year: this.getSeasonYear(),
	  	emergency: { 
	  		primary: {
	  			name:'james man',
	  			relationship:'uncle',
	  			phone:'5125736325'
	  	}, 
	  		secondary: {
	  			name:'jane man',
	  			relationship:'aunt',
	  			phone:'5121369856'
	  		}
	  	},
	  	consents:{
			REP:true,
	  		LIABILITY:true,
	  		CONDUCT_LOCAL:true,
	  		CONDUCT_LEAGUE:true,
	  		FEES:true,
	  		IMAGE:true
	  	},
	  	medical:{ 
	  		physician:'Sean Ditty',
	  		physicianNum:'3652659685',
	  		insurance:'cigna',
	  		policy:'0A15795658',
	  		callNum:'18003336666',
	  		allergies:'N/A',
	  		conditions:'N/A',
	  		medications:'N/A'
	  	},
	  	guardian:{ 
	  		primary: {
	  			name:'Mommy Doe',
	  			email:'zzz@xx.com',
	  			phone:'3596589963'
	  		}, 
	  		secondary: {
	  			name:'Daddy Doe',
	  			phone:'9876541259'
	  		}
	  	}
	  };

	  this.ps.changePlayer(player);
	  // console.log(this);
  }

  private getSeasonYear(){
  	const today = new Date();
  	if(today.getMonth()+1 >= 7)
	  	return today.getFullYear().toString() + '-' + (today.getFullYear()+1).toString();
	  else 
	  	return (today.getFullYear()-1).toString() + '-' + today.getFullYear().toString();
  }

  isRegOpen(){
  	/* Registration con be done from July until January */
  	const today = new Date();
  	const thisMonth = today.getMonth() + 1;
  	if( thisMonth >= 7)
  		return true;
  	return false;
  }


}
