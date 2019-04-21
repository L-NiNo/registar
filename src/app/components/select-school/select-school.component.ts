import { Component, OnInit } from '@angular/core';
import { PlayerService } from '../../services/player/player.service';

@Component({
  selector: 'school-selector',
  templateUrl: './select-school.component.html',
  styleUrls: ['./select-school.component.scss']
})
export class SelectSchoolComponent implements OnInit {
  public schools = {
    DSHS: {
      name: 'High School',
      value: 'DSHS'
    },
    DSMS: {
      name: "Middle School",
      value: "DSMS"
    }
  };
  public player;
  public view;
  public header = "What school does the player attent?";
  constructor(
    private ps: PlayerService
  ) {
    this.ps.player.subscribe(data => {
      if (data) this.player = data;
    });
    this.ps.view.subscribe(data => {
      if (data) this.view = data;
      // if(this.view) console.log(this.view);
    });
  }

  ngOnInit() { }

  assignSchool(val) {
    if (!val) return;
    // console.log(val);
    if (this.player) {
      this.player.school = val;
      this.ps.changePlayer(this.player);
      this.ps.changeView('NAT_ID');
    }
  }

}
