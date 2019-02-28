import { Directive, HostListener } from '@angular/core';
import { FormControl, NG_VALIDATORS } from '@angular/forms';
import { RegexSettings } from '../classes/regexes';

const declaredType = 'postalCode';

@Directive({
  selector: '[appPostalCode]'
})
export class PostalCodeDirective {

  	regexes:any;
    	constructor(private locale: LocalizationService) {
    		this.regexes = RegexSettings;
    	}

    	@HostListener('blur', ['$event']) onBlur(evt: any){
  		if(!evt || !evt.target || !evt.target.value || evt.target.className.indexOf(declaredType) < 0)
  			return;
          evt.target.value = this.typeFormat(evt.target.value.toUpperCase());
  	}

  	@HostListener('focus', ['$event']) onFocus(evt: any){
  		if(evt && evt.target && evt.target.value && evt.target.className.indexOf(declaredType) > -1)
  			evt.target.value = this.stripString(evt.target.value);
  	}
  	/*
  	Strip value of any defined delimiter for the type of input
  	*/
  	stripString(value) {
  	    if (!this.regexes.delimCharacters[declaredType]) return value;
  	    if (!this.regexes.delimCharacters[declaredType].delim) return value;
  	    return value.replace(this.regexes.delimCharacters[declaredType].delim, "");
  	}
  	/**
       Format value based on regex ofthe type of card
       */
      typeFormat(value) {
          if (!this.regexes.formatCharacters[declaredType]) return value;
          let regEx = this.regexes.formatCharacters[declaredType];
          return value.replace(regEx.mask, regEx.rep);
      }
  }
