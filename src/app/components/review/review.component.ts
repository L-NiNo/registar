import { Component, OnInit } from '@angular/core';
import { PlayerService } from '../../services/player/player.service';

@Component({
  selector: 'app-review',
  templateUrl: './review.component.html',
  styleUrls: ['./review.component.scss']
})
export class ReviewComponent implements OnInit {
  public header;
  public newPlayerHeader = "Enter Player Information";
  public returningPlayerHeader = "Verify Player Information";
  public player;
  public view;

  constructor(private ps: PlayerService) {
    this.ps.player.subscribe(data => {
      if(data) this.player = data;
      this.header = (this.player && this.player.status == 'RETURN')?this.returningPlayerHeader:(this.player && this.player.status == 'NEW')?this.newPlayerHeader:'';
    });
    this.ps.view.subscribe( data => {
      if(data) this.view = data;
    });
  }

  ngOnInit() {
  }

  submit(){
    // this.ps.changePlayer(this.player);
    // this.ps.changeView('CONSENT');
  }

  back(state){
    this.ps.changeView(state);
  }
}
