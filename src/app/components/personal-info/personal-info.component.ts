import { Component, OnInit } from '@angular/core';
import { DatePipe } from '@angular/common';
import { PlayerService } from '../../services/player/player.service';
import { MonthList } from '../../classes/months';
import { RegexSettings } from '../../classes/regexes';

@Component({
  selector: 'app-personal-info',
  providers: [DatePipe],
  templateUrl: './personal-info.component.html',
  styleUrls: ['./personal-info.component.scss']
})
export class PersonalInfoComponent implements OnInit {
  public header;
  private newPlayerHeader = "Enter Player Information";
  private returningPlayerHeader = "Verify Player Information";
  public player;
  public view;
  public isEdit;
  public emailPatterm = RegexSettings.email.pattern;
  // public email = RegexSettings.allowedCharacters.email;
  public DOB = { days: [], months: MonthList, years: [] };

  constructor(private ps: PlayerService, private datePipe: DatePipe) {
    this.ps.player.subscribe(data => {
      if (data) this.player = data;
      // if(this.player.dob.year) 
      this.header = (this.player && this.player.status == 'RETURN') ? this.returningPlayerHeader : (this.player && this.player.status == 'NEW') ? this.newPlayerHeader : '';
    });
    this.ps.view.subscribe(data => {
      if (data) this.view = data;
      // if(this.view) console.log(this.view);
    });
    this.ps.etiting.subscribe(data => { this.isEdit = data; });
    let days = [];
    let months = MonthList;
    let years = [];
    for (let i: number = 1; i < 32 + 1; i++)
      days.push(i);
    this.DOB.days = days;
    // this.player.dob.day = (this.player.dob.day)?this.player.dob.day:this.DOB.days[0];
    this.player.dob.day = (this.player.dob.day) ? this.player.dob.day : 0;
    // this.player.dob.day = 0;

    this.DOB.months = months;
    // this.player.dob.month = (this.player.dob.month)?this.player.dob.month:this.DOB.months[0].value;
    // this.player.dob.month = 0;
    this.player.dob.month = (this.player.dob.month) ? this.player.dob.month : 0;

    let yr = (new Date()).getFullYear() - 29;
    for (let y: number = yr; y < (new Date()).getFullYear(); y++)
      years.push(y);

    this.DOB.years = years;
    // this.player.dob.year = (this.player.dob.year)?this.player.dob.year:this.DOB.years[0];
    this.player.dob.year = (this.player.dob.year) ? this.player.dob.year : 0;
  }

  ngOnInit() {
    // console.log(this.DOB);
  }
  submit() {

    this.ps.changePlayer(this.player);
    if (this.isEdit)
      return this.ps.changeView('REVIEW');
    this.ps.changeView('ADDY');
  }
  onMonthChange(month) {
    console.log(month);
    let numDays = MonthList[month - 1].days;
    let days = [];
    for (let i: number = 1; i < numDays + 1; i++)
      days.push(i);
    this.DOB.days = days;
  }
  // TODO: account for leap years if propper year is selected
  isLeapYear(year) {
    return ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0);
  }

  onDobChange() {
    let day = this.player.dob.day;
    let month = this.player.dob.month;
    let year = this.player.dob.year;
    if (!year || !month || !day) return;
    this.player.dob.string = this.datePipe.transform(new Date(String(day).concat('/').concat(String(month)).concat('/').concat(String(year))), 'dd/MM/yyyy');
  }

}
