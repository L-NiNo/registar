export class Contact {
    name: string;
    relationship?: string;
    phone: string;
    email?: string;

    constructor(
        name: string,
        relationship: string,
        phone: string,
        email: string
    ) {
        this.name = name;
        this.relationship = relationship;
        this.phone = phone;
        this.email = email;
    }
}