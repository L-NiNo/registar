import { Component, OnInit } from '@angular/core';
import { PlayerService } from '../../services/player/player.service';

@Component({
  selector: 'app-consents',
  templateUrl: './consents.component.html',
  styleUrls: ['./consents.component.scss']
})
export class ConsentsComponent implements OnInit {
  public header;
  public consentHeader = "Terms & Conditions Agreement";
  public player;
  public view;
  marked = false;
  constructor(private ps: PlayerService) {
    this.ps.player.subscribe(data => {
      if(data) this.player = data;
      this.header = this.consentHeader;
    });
    this.ps.view.subscribe( data => {
      if(data) this.view = data;
    });
  }

  ngOnInit() {
  }

  submit(){
    this.ps.changePlayer(this.player);
    this.ps.changeView('REVIEW');
  }

  back(){
    this.ps.changeView('MEDICAL');
  }

  toggleVisibility(e){
    this.marked= e.target.checked;
  }
}
