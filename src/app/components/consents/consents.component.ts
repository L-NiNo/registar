import { Component, OnInit } from '@angular/core';
import { PlayerService } from '../../services/player/player.service';
import { ConsentData } from './ConsentData'
import { cloneDeep } from 'lodash';
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
  public isEdit;

  public data = {};
  public consents = [];
  public consentsArr = [];


  marked = false;

  constructor(private ps: PlayerService) {
    this.ps.player.subscribe(data => {
      if(data) this.player = data;
      this.header = this.consentHeader;
      this.tranformData();
    });
    this.ps.view.subscribe( data => {
      if(data) this.view = data;
    });
    this.ps.etiting.subscribe(data=>{ this.isEdit = data; });
  }

ngOnInit() {
    this.tranformData();
  }

  submit(){
    this.ps.changePlayer(this.player);
    // SUBMIT to DB
    console.log("submit info to db")
    this.ps.changeView('SUCCESS');
  }

  back(){
    this.ps.changeView('MEDICAL');
  }

  toggleVisibility(e){
    this.marked= e.target.checked;
  }

  tranformData(){
    this.consentsArr = [];
    ConsentData.forEach((item)=>{
      item.title = this.replaceYear(item.title);
      this.data[item.id] = item;
    });
    this.consents = Object.keys(this.data);
    this.consents.forEach(consent => {
      this.consentsArr.push(this.data[consent]);
    });
    console.log(cloneDeep(this.data));
    console.log(cloneDeep(this.consentsArr));
  }
  onChangeEvent(data, e){
    console.log(e);
    this.player.consents[data] = e;
  }
  private replaceYear(title:string){
    if(title && title.indexOf(':YEAR')>-1)
      return title.replace(':YEAR', String(this.player.year));
    return title;
  }

}
