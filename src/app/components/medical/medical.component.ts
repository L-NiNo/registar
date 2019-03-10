import { Component, OnInit } from '@angular/core';
import { PlayerService } from '../../services/player/player.service';

@Component({
  selector: 'app-medical',
  templateUrl: './medical.component.html',
  styleUrls: ['./medical.component.scss']
})
export class MedicalComponent implements OnInit {
  public header;
  public newPlayerHeader = "Enter Player Information";
  public returningPlayerHeader = "Verify Player Information";
  public player;
  public view;
  public isEdit;

  constructor(private ps: PlayerService) {
    this.ps.player.subscribe(data => {
      if(data) this.player = data;
      this.header = (this.player && this.player.status == 'RETURN')?this.returningPlayerHeader:(this.player && this.player.status == 'NEW')?this.newPlayerHeader:'';
    });
    this.ps.view.subscribe( data => {
      if(data) this.view = data;
    });
    this.ps.etiting.subscribe(data=>{ this.isEdit = data; });
  }

  ngOnInit() {
  }

  submit(){
    this.ps.changePlayer(this.player);
    if(this.isEdit) 
      return this.ps.changeView('REVIEW');
    this.ps.changeView('REVIEW');
  }

  back(){
    this.ps.changeView('EMERGENCY');
  }
}
