import { Component, OnInit } from '@angular/core';
import { DatePipe } from '@angular/common';
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
const emailRegex = /(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/;

@Component({
  selector: 'app-personal-info',
  providers:[DatePipe],
  templateUrl: './personal-info.component.html',
  styleUrls: ['./personal-info.component.scss']
})
export class PersonalInfoComponent implements OnInit {
	public header;
	public newPlayerHeader = "Enter Player Information";
	public returningPlayerHeader = "Verify Player Information";
	public player;
	public view;
	public emailPatterm = emailRegex;
	public DOB = { days:[], months: MonthList, years:[] };

  constructor(private ps: PlayerService, private datePipe: DatePipe) {
  	this.ps.player.subscribe(data => {
  		if(data) this.player = data;
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
    // this.player.dob.day = (this.player.dob.day)?this.player.dob.day:this.DOB.days[0];
    this.player.dob.day = 0;

    this.DOB.months = months;
    // this.player.dob.month = (this.player.dob.month)?this.player.dob.month:this.DOB.months[0].value;
    this.player.dob.month = 0;

    let yr = (new Date()).getFullYear() - 29;
    for (let y: number = yr; y < (new Date()).getFullYear(); y++)
    	years.push(y);

    this.DOB.years = years;
    // this.player.dob.year = (this.player.dob.year)?this.player.dob.year:this.DOB.years[0];
    this.player.dob.year = 0;
   }

  ngOnInit() {
  	// console.log(this.DOB);
  }
  submit(){
		this.ps.changePlayer(this.player);
		this.ps.changeView('ADDY');
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
  onDobChange(){
  	let day = this.player.dob.day;
  	let month = this.player.dob.month;
  	let year = this.player.dob.year;
  	if(!year || !month ||!day) return;
  	this.player.dob.string = this.datePipe.transform(new Date(String(day).concat('/').concat(String(month)).concat('/').concat(String(year))),'dd/MM/yyyy');
  }

}
