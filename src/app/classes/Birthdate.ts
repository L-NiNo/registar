export class Birthdate { 
    day: string; 
    month: string;
    year: string;
    birthday: string;
    
    constructor(
        day?:string, 
        month?:string, 
        year?:string 
    ){
        this.day = day;
        this.month = month;
        this.year = year;
        if(this.year && this.month && this.day)
            this.birthday = this.toString();
    }

    toString(){
        return this.getMonth().concat('/').concat(this.getDay()).concat('/').concat(this.year);
    }

    setBirthday(){
        this.birthday = this.toString();
    }

    getBithday(){
        return this.birthday;        
    }

    clearBirthday(){
        this.birthday = '';
    }

    private getDay(){
        if(Number(this.day) > 10) return this.day;
        return '0'.concat(this.day);
    }

    private getMonth(){
        if(Number(this.month) > 10) return this.month;
        return '0'.concat(this.month);
    }
}
