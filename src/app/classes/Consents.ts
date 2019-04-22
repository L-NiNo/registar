export class Consents {
    REP: boolean;
    LIABILITY: boolean;
    CONDUCT_LOCAL: boolean;
    CONDUCT_LEAGUE: boolean;
    FEES: boolean;
    IMAGE?: boolean;

    constructor(rep: boolean, liability: boolean, conduct_local: boolean, conduct_league: boolean, fees: boolean, image: boolean) {
        this.REP = rep;
        this.LIABILITY = liability;
        this.CONDUCT_LOCAL = conduct_local;
        this.CONDUCT_LEAGUE = conduct_league;
        this.FEES = fees;
        this.IMAGE = image;
    }

}