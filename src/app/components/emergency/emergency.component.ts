import { Component, OnInit } from '@angular/core';
import { PlayerService } from '../../services/player/player.service';


const Relationships = [
  { id: 'relative', name: "Relative" },
  { id: 'friend', name: "Friend" },
  { id: 'other', name: "Other" }
];

@Component({
  selector: 'app-emergency',
  templateUrl: './emergency.component.html',
  styleUrls: ['./emergency.component.scss']
})
export class EmergencyComponent implements OnInit {
  public header;
  public newPlayerHeader = "Enter Player Information";
  public returningPlayerHeader = "Verify Player Information";
  public player;
  public view;
  public isEdit;
  public secondary;
  public relationships = Relationships;



  constructor(private ps: PlayerService) {
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
    if (this.player && this.player.emergency && this.player.emergency.secondary && this.player.emergency.secondary) {
      if ((this.player.emergency.secondary.phone && this.player.emergency.secondary.phone !== "") ||
        (this.player.emergency.secondary.name && this.player.emergency.secondary.name !== "")) {
        this.secondary = true;
      }
    }
  }

  submit() {
    this.ps.changePlayer(this.player);
    if (this.isEdit)
      return this.ps.changeView('REVIEW');
    this.ps.changeView('MED');
  }

  back() {
    this.ps.changeView('GUARD');
  }
}
