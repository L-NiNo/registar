import { Component, OnInit } from '@angular/core';
import { PlayerService } from '../../services/player/player.service';
import { StatesObj } from 'src/app/models/States';

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
  public states;

  constructor(private ps: PlayerService) {
    this.ps.player.subscribe(data => {
      if (data) this.player = data;
      this.player.address.state = (this.player && this.player.address && this.player.address.state) ? this.player.address.state : 'Texas';
      this.header = (this.player && this.player.status == 'RETURN') ? this.returningPlayerHeader : (this.player && this.player.status == 'NEW') ? this.newPlayerHeader : '';
    });
    this.ps.view.subscribe(data => {
      if (data) this.view = data;
    });
    this.ps.etiting.subscribe(data => { this.isEdit = data; });
    this.states = this.buildStatesArray()
  }

  ngOnInit() {
  }

  submit() {
    this.ps.changePlayer(this.player);
    if (this.isEdit)
      return this.ps.changeView('REVIEW');
    this.ps.changeView('GUARD');
  }

  back() {
    this.ps.changeView('PI');
  }

  buildStatesArray() {
    let _states = [];
    Object.keys(StatesObj).forEach((val) => {
      _states.push({ id: val, name: StatesObj[val] });
    });
    return _states;
  }

}
