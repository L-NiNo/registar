import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';
import { ButtonsModule } from 'ngx-bootstrap/buttons';
import { FormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { SelectSchoolComponent } from './components/select-school/select-school.component';
import { PlayerLookupComponent } from './components/player-lookup/player-lookup.component';
import { PlayerService } from './services/player/player.service';
import { HeaderService } from './services/header/header.service';
import { NationalInputComponent } from './components/national-input/national-input.component';
import { LoadingComponent } from './components/loading/loading.component';
import { PersonalInfoComponent } from './components/personal-info/personal-info.component';
import { AddressComponent } from './components/address/address.component';
import { MedicalComponent } from './components/medical/medical.component';
import { ConsentsComponent } from './components/consents/consents.component';
import { GuardianComponent } from './components/guardian/guardian.component';
import { EmergencyComponent } from './components/emergency/emergency.component';
import { TextComponent } from './components/text/text.component';
import { ValidationHelperDirective } from './directives/validation.directive';
import { ReviewComponent } from './components/review/review.component';
import { TextErrorComponent } from './components/text-error/text-error.component';



@NgModule({
  declarations: [
    AppComponent,
    SelectSchoolComponent,
    PlayerLookupComponent,
    NationalInputComponent,
    LoadingComponent,
    PersonalInfoComponent,
    AddressComponent,
    MedicalComponent,
    ConsentsComponent,
    GuardianComponent,
    EmergencyComponent,
    TextComponent,
    ValidationHelperDirective,
    ReviewComponent,
    TextErrorComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    ButtonsModule.forRoot()
  ],
  providers: [ PlayerService, HeaderService ],
  bootstrap: [AppComponent]
})
export class AppModule { }
