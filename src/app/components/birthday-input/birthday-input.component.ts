import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { ControlContainer, NgForm } from '@angular/forms';
import { Birthdate } from 'src/app/classes/Birthdate';
import { MonthList } from 'src/app/classes/months';
import { PlayerService } from 'src/app/services/player/player.service';


@Component({
  selector: 'app-birthday',
  templateUrl: './birthday-input.component.html',
  styleUrls: ['./birthday-input.component.scss'],
  viewProviders: [{ provide: ControlContainer, useExisting: NgForm }]
})
export class BirthdayInputComponent implements OnInit {
  @Output() modelChange: EventEmitter<Birthdate> = new EventEmitter<Birthdate>();
  @Input() model: Birthdate

  public DOB = { days: [], months: MonthList, years: [] };

  constructor(
    private ps: PlayerService
  ) {
    this.populateSelects();
  }

  ngOnInit() {
    this.setDob();
  }

  populateSelects() {
    let days = [];
    let months = MonthList;
    let years = [];
    for (let i: number = 1; i < 32 + 1; i++)
      days.push(i);
    this.DOB.days = days;

    this.DOB.months = months;

    let yr = (new Date()).getFullYear() - 29;
    for (let y: number = yr; y < (new Date()).getFullYear(); y++)
      years.push(y);

    this.DOB.years = years;
  }

  setDob() {
    this.model.day = (this.model.day) ? Number(this.model.day) : 0;
    this.model.month = (this.model.month) ? Number(this.model.month) : 0;
    this.model.year = (this.model.year) ? Number(this.model.year) : 0;
  }

  onMonthChange(month) {
    console.log(month);
    if (month === '0')
      this.model.month = 0;
    if (!month || month === '0') return;
    let numDays = MonthList[month - 1].days;
    let days = [];
    for (let i: number = 1; i < numDays + 1; i++)
      days.push(i);
    this.DOB.days = days;
  }

  checkYear(year) {
    if (this.model.month === 2) {
      if (this.isLeapYear(year)) {
        this.DOB.days.push(29);
      } else {
        this.onMonthChange(this.model.month);
      }
    }
  }

  isLeapYear(year) {
    return ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0);
  }

  onDobChange() {
    let day = Number(this.model.day);
    let month = Number(this.model.month);
    let year = Number(this.model.year);
    if (!year || !month || !day) return this.model.clearBirthday();
    this.model = new Birthdate(day, month, year);
    this.modelChange.emit(this.model);
  }

}
