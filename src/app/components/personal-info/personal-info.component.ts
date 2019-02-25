import { Component, OnInit } from '@angular/core';
import { PlayerService } from '../../services/player/player.service';

const MonthList = [
	{ value:1, name:"January", days: 31},
	{ value:2, name:"February", days: 28},
	{ value:3, name:"March", days: 31},
	{ value:4, name:"April", days: 30},
	{ value:5, name:"May", days: 31},
	{ value:6, name:"June", days: 30},
	{ value:7, name:"July", days: 31},
	{ value:8, name:"August", days: 31},
	{ value:9, name:"September", days: 30},
	{ value:10, name:"October", days: 31},
	{ value:11, name:"November", days: 30},
	{ value:12, name:"December", days: 31}
]

@Component({
  selector: 'app-personal-info',
  templateUrl: './personal-info.component.html',
  styleUrls: ['./personal-info.component.scss']
})
export class PersonalInfoComponent implements OnInit {
	public header;
	public newPlayerHeader = "Enter Player Information";
	public returningPlayerHeader = "Verify Player Information";
	public player;
	public view;
	public states = ['Alabama','Alaska','American Samoa','Arizona','Arkansas','California','Colorado','Connecticut','Delaware','District of Columbia','Federated States of Micronesia','Florida','Georgia','Guam','Hawaii','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Marshall Islands','Maryland','Massachusetts','Michigan','Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada','New Hampshire','New Jersey','New Mexico','New York','North Carolina','North Dakota','Northern Mariana Islands','Ohio','Oklahoma','Oregon','Palau','Pennsylvania','Puerto Rico','Rhode Island','South Carolina','South Dakota','Tennessee','Texas','Utah','Vermont','Virgin Island','Virginia','Washington','West Virginia','Wisconsin','Wyoming'];
	public DOB = { days:[], months: MonthList, years:[] };
  constructor(private ps: PlayerService) {
  	this.ps.player.subscribe(data => {
  		if(data) this.player = data;
  		this.player.address.state = (this.player && this.player.address && this.player.address.state)?this.player.address.state:'Texas';
  		this.header = (this.player && this.player.status == 'RETURN')?this.returningPlayerHeader:(this.player && this.player.status == 'NEW')?this.newPlayerHeader:'';
  	});
  	this.ps.view.subscribe( data => {
      if(data) this.view = data;
      // if(this.view) console.log(this.view);
    });
    let days = [];
    let months = MonthList;
    let years = [];
  	for (let i: number = 1; i < 32 + 1; i++)
    	days.push(i);
    this.DOB.days = days;
    this.player.dob.day = (this.player.dob.day)?this.player.dob.day:this.DOB.days[0];
    
    this.DOB.months = months;
    this.player.dob.month = (this.player.dob.month)?this.player.dob.month:this.DOB.months[0].value;

    let yr = (new Date()).getFullYear() - 29;
    for (let y: number = yr; y < (new Date()).getFullYear(); y++)
    	years.push(y); 

    this.DOB.years = years;
    this.player.dob.year = (this.player.dob.year)?this.player.dob.year:this.DOB.years[0];
   }

  ngOnInit() {
  	console.log(this.DOB);
  }
  onMonthChange(month){
  	console.log(month);
  	let numDays = MonthList[month - 1].days; 
  	let days = [];
  	for (let i: number = 1; i < numDays + 1; i++)
    	days.push(i);
    this.DOB.days = days;
  }

  isLeapYear(year){
 	return ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0);
  }

}
