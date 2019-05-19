import { Address } from './Address';
import { Birthdate } from './Birthdate';
import { Emergency } from './Emergency';
import { Consents } from './Consents';
import { Medical } from './Medical';
import { Guardian } from './Guardian';

export class Player {
    status?: any;
    nationalId?: string;
    id?: string;
    fname?: string;
    lname?: string;
    email?: string;
    address?: Address;
    dob?: Birthdate;
    school?: string;
    grade?: string;
    year?: string;
    emergency?: Emergency;
    consents?: Consents;
    medical?: Medical;
    guardian?: Guardian;

    constructor(
        status?: any,
        nationalId?: string,
        id?: string,
        fname?: string,
        lname?: string,
        email?: string,
        shirt?: string,
        shorts?: string,
        address?: Address,
        dob?: Birthdate,
        school?: string,
        grade?: string,
        year?: string,
        emergency?: Emergency,
        consents?: Consents,
        medical?: Medical,
        guardian?: Guardian,
    ) {
        this.status = status;
        this.nationalId = nationalId;
        this.id = id;
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.address = address;
        this.dob = new Birthdate();
        this.school = school;
        this.grade = grade;
        this.year = this.getSeasonYear();
        this.emergency = emergency;
        this.consents = consents;
        this.medical = medical;
        this.guardian = guardian;
    }

    private getSeasonYear() {
        const today = new Date();
        if (today.getMonth() + 1 >= 7)
            return today.getFullYear().toString() + '-' + (today.getFullYear() + 1).toString();
        else
            return (today.getFullYear() - 1).toString() + '-' + today.getFullYear().toString();
    }
}