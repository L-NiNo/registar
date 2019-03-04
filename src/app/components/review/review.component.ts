import { Component, OnInit } from '@angular/core';
import { PlayerService } from '../../services/player/player.service';

@Component({
  selector: 'app-review',
  templateUrl: './review.component.html',
  styleUrls: ['./review.component.scss']
})
export class ReviewComponent implements OnInit {
  public header;
  public reviewHeader = "Please Review Information";
  public returningPlayerHeader = "Verify Player Information";
  public player;
  public view;

  constructor(private ps: PlayerService) {
    this.ps.player.subscribe(data => {
      if(data) this.player = data;
      this.header = this.reviewHeader;
    });
    this.ps.view.subscribe( data => {
      if(data) this.view = data;
    });
  }

  ngOnInit() {
  }

  submit(){
    console.log("submit info to db");
    console.log("submit info to db");
    // this.ps.changePlayer(this.player);
    // this.ps.changeView('CONSENT');
  }

  returnTo(state){
    this.ps.changeView(state);
  }
}
