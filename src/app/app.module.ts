import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';
import { ButtonsModule } from 'ngx-bootstrap/buttons';
import { FormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { SelectSchoolComponent } from './components/select-school/select-school.component';
import { PlayerLookupComponent } from './components/player-lookup/player-lookup.component';
import { PlayerService } from './services/player/player.service';
import { NationalInputComponent } from './components/national-input/national-input.component';
import { LoadingComponent } from './components/loading/loading.component';
import { PersonalInfoComponent } from './components/personal-info/personal-info.component';



@NgModule({
  declarations: [
    AppComponent,
    SelectSchoolComponent,
    PlayerLookupComponent,
    NationalInputComponent,
    LoadingComponent,
    PersonalInfoComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    ButtonsModule.forRoot()
  ],
  providers: [ PlayerService ],
  bootstrap: [AppComponent]
})
export class AppModule { }
