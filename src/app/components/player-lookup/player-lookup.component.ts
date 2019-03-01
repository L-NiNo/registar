import { Component, OnInit } from '@angular/core';
import { PlayerService } from '../../services/player/player.service';

@Component({
  selector: 'player-lookup',
  templateUrl: './player-lookup.component.html',
  styleUrls: ['./player-lookup.component.scss']
})
export class PlayerLookupComponent implements OnInit {
  public player;
	public view;
  public header = "Are you a new or returning player to Dripping Springs Girls Lacrosse?";

  constructor(private ps: PlayerService) {
  	this.ps.player.subscribe(data => {
  		if(data) this.player = data;
  	});
    this.ps.view.subscribe( data => {
      if(data) this.view = data;
      // if(this.view) console.log(this.view);
    });
  }

  ngOnInit() {
  }

  setStatus(val){
    if(!val) return;
	  console.log("Player is: " + val);
  	if(this.player) {
  		this.player.status = val;
      this.ps.changePlayer(this.player);
  		this.ps.changeView('SCHOOL');
  	}
  }

}
