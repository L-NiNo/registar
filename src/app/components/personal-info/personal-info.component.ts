import { Component, OnInit } from '@angular/core';
import { DatePipe } from '@angular/common';
import { PlayerService } from '../../services/player/player.service';
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
  public emailPatterm = RegexSettings.email.pattern.source;
  // public email = RegexSettings.allowedCharacters.email;

  constructor(
    private ps: PlayerService,
    private datePipe: DatePipe
  ) {
    this.ps.player.subscribe(data => {
      if (data) this.player = data;
      this.header = (this.player && this.player.status == 'RETURN') ? this.returningPlayerHeader : (this.player && this.player.status == 'NEW') ? this.newPlayerHeader : '';
    });
    this.ps.view.subscribe(data => {
      if (data) this.view = data;
    });
    this.ps.etiting.subscribe(data => { this.isEdit = data; });

  }

  ngOnInit() {
  }

  submit() {
    this.ps.changePlayer(this.player);
    if (this.isEdit)
      return this.ps.changeView('REVIEW');
    this.ps.changeView('ADDY');
  }
}
