import { Directive, Input, HostListener } from "@angular/core";
import { RegexSettings } from '../classes/regexes';

@Directive({
  selector: '[appValidationHelper]'
})
export class ValidationHelperDirective {
    regexes: any;
    constructor() {
      this.regexes = RegexSettings;
    }
    @Input() appValidationHelper: string;
    @Input() maxlength;
    @HostListener("keypress", ["$event"])
    onChange(evt: any) {
      const declaredType = this.appValidationHelper;
      const maxlength = this.maxlength;
      if (!evt || !evt.target) return;
      this.doPrevent(maxlength, declaredType, evt);
    }

    @HostListener("blur", ["$event"])
    onBlur(evt: any) {
      const declaredType = this.appValidationHelper;
      if (!evt || !evt.target || !evt.target.value) return;
      /*Prevent conflict with other formatter directive*/
      if (declaredType && declaredType !== "creditCard") {
        evt.target.value = this.stripString(evt.target.value, declaredType);
      }
    }

    doPrevent(maxlength, declaredType, evt) {
      let val = this.stripString(evt.target.value, declaredType);
      if (!this.isFireFoxExclusion(evt)) {
        this.testLength(evt, maxlength, val.length);
        this.testRegex(declaredType, evt);
      }
    }

    testRegex(declaredType, event) {
      if (!this.regexes.allowedCharacters[declaredType]) return;
      let regEx = this.regexes.allowedCharacters[declaredType];
      this.eventKeyPress_evaluateRegex(event, regEx);
    }

    /**
      Validates input matches the input types regex
      */
    eventKeyPress_evaluateRegex(evt, regex) {
      let key = evt.which ? evt.which : evt.keyCode;
      if (!regex.test(String.fromCharCode(key))) evt.preventDefault();
    }

    /**
      Compared stripped value to maxlength to detirming if actual maxlength is met to block input
      */
    testLength(e, max, actual) {
      if (actual === max) e.preventDefault();
    }

    /**
      Strip value of any defined delimiter for the type of input
      */
    stripString(value, declaredType) {
      if (!this.regexes.delimCharacters[declaredType]) return value;
      if (!this.regexes.delimCharacters[declaredType].delim) return value;
      return value.replace(this.regexes.delimCharacters[declaredType].delim, "");
    }

    /**
      FireFox exclusions for backspace/del/tab/enter/arrows issues
      */
    isFireFoxExclusion(evt) {
      let key = evt.which ? evt.which : evt.keyCode;
      let exclusions = [8, 9, 13, 35, 36, 37, 38, 39, 40, 46];
      if (exclusions.indexOf(key) > -1) return true;
      return false;
    }
  }
