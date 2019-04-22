import { Contact } from './Contact';

export class Emergency {
    primary: Contact;
    secondary?: Contact;

    constructor(
        primary: Contact,
        secondary: Contact
    ) {
        this.primary = primary;
        this.secondary = secondary;
    }
}