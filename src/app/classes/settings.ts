import { objStates, arrStates } from './States';
import { Months } from './months';
const st_list = arrStates;
export const Settings: any = {
    addressSettings: {
        address: {
            maxlength: 80,
            minlength: 1
        },
        city: {
            maxlength: 80,
            minlength: 1
        },
        state: {
            stateList: [],
            maxlength: 2
        },
        postalCode: {
            maxlength: 5,
            minlength: 5
        }
    },
    phoneNumber: {
        minlength: 10
    },
    stateObj: objStates,
    monthObj: Months
};
