export class Birthdate {
    day: string | number;
    month: string | number
    year: string | number;
    birthday: string;

    constructor(
        day?: string | number,
        month?: string | number,
        year?: string | number,
        birthday?: string
    ) {
        this.day = day;
        this.month = month;
        this.year = year;
        if (this.year && this.month && this.day)
            this.birthday = this.toString();
    }

    toString() {
        return String(this.getMonth()).concat('/').concat(String(this.getDay())).concat('/').concat(String(this.year));
    }

    setBirthday() {
        this.birthday = this.toString();
    }

    getBithday() {
        return this.birthday;
    }

    clearBirthday() {
        this.birthday = '';
    }

    private getDay() {
        if (Number(this.day) > 10) return this.day;
        return '0'.concat(String(this.day));
    }

    private getMonth() {
        if (Number(this.month) > 10) return this.month;
        return '0'.concat(String(this.month));
    }
}
