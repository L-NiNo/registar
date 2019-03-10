import { Component, OnInit } from '@angular/core';
import { PlayerService } from '../../services/player/player.service';

const stateArray = ['Alabama','Alaska','American Samoa','Arizona','Arkansas','California','Colorado','Connecticut','Delaware','District of Columbia','Federated States of Micronesia','Florida','Georgia','Guam','Hawaii','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Marshall Islands','Maryland','Massachusetts','Michigan','Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada','New Hampshire','New Jersey','New Mexico','New York','North Carolina','North Dakota','Northern Mariana Islands','Ohio','Oklahoma','Oregon','Palau','Pennsylvania','Puerto Rico','Rhode Island','South Carolina','South Dakota','Tennessee','Texas','Utah','Vermont','Virgin Island','Virginia','Washington','West Virginia','Wisconsin','Wyoming'];

@Component({
  selector: 'app-address',
  templateUrl: './address.component.html',
  styleUrls: ['./address.component.scss']
})
export class AddressComponent implements OnInit {
  public header;
  public newPlayerHeader = "Enter Player Information";
  public returningPlayerHeader = "Verify Player Information";
  public player;
  public isEdit;
  public view;
  public states = stateArray;

  constructor(private ps: PlayerService) {
    this.ps.player.subscribe(data => {
      if(data) this.player = data;
      this.player.address.state = (this.player && this.player.address && this.player.address.state)?this.player.address.state:'Texas';
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
    this.ps.changeView('GUARD');
  }

  back(){
    this.ps.changeView('PI');
  }

}
