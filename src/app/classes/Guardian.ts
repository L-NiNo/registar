import { Contact } from './Contact';

export class Guardian {
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