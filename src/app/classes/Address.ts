export class Address {
    street1: string;
    street2: string;
    city: string;
    state: string;
    zip: string;

    constructor(
        street1: string,
        street2: string,
        city: string,
        state: string,
        zip: string,
    ) {
        this.street1 = street1;
        this.street2 = street2;
        this.city = city;
        this.state = state;
        this.zip = zip;
    }
}