export class Medical {
    physician: string;
    physicianNum: string;
    insurance: string;
    policy: string;
    callNum: string;
    allergies: string;
    conditions: string;
    medications: string;

    constructor(
        physician: string,
        physicianNum: string,
        insurance: string,
        policy: string,
        callNum: string,
        allergies: string,
        conditions: string,
        medications: string
    ) {
        this.physician = physician;
        this.physicianNum = physicianNum;
        this.insurance = insurance;
        this.policy = policy;
        this.callNum = callNum;
        this.allergies = allergies;
        this.conditions = conditions;
        this.medications = medications;
    }
}