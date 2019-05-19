import { Component, OnInit } from '@angular/core';
import { PlayerService } from '../../services/player/player.service';
import { RegexSettings } from 'src/app/classes/regexes';

@Component({
  selector: 'app-guardian',
  templateUrl: './guardian.component.html',
  styleUrls: ['./guardian.component.scss']
})
export class GuardianComponent implements OnInit {
  public header;
  public newPlayerHeader = "Enter Player Information";
  public returningPlayerHeader = "Verify Player Information";
  public player;
  public view;
  public isEdit;
  public secondary;
  public emailPattern = RegexSettings.email.pattern.source;

  constructor(private ps: PlayerService) {
    this.ps.player.subscribe(data => {
      if (data) this.player = data;
      this.ngOnInit();
      this.header = (this.player && this.player.status == 'RETURN') ? this.returningPlayerHeader : (this.player && this.player.status == 'NEW') ? this.newPlayerHeader : '';
    });
    this.ps.view.subscribe(data => {
      if (data) this.view = data;
    });
    this.ps.etiting.subscribe(data => { this.isEdit = data; });
  }

  ngOnInit() {
    if (this.player && this.player.guardian && this.player.guardian.secondary && this.player.guardian.secondary) {
      if ((this.player.guardian.secondary.phone && this.player.guardian.secondary.phone !== "") ||
        (this.player.guardian.secondary.name && this.player.guardian.secondary.name !== "") ||
        (this.player.guardian.secondary.eamil && this.player.guardian.secondary.email !== "")) {
        this.secondary = true;
      }

    }
  }

  submit() {
    this.ps.changePlayer(this.player);
    if (this.isEdit)
      return this.ps.changeView('REVIEW');
    this.ps.changeView('EMERGENCY');
  }

  back() {
    this.ps.changeView('ADDY');
  }

}
