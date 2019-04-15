export const RegexSettings = {
	allowedCharacters: {
        addressCharacters: /[a-zA-Z0-9\s#\.'`-]/,
        alphaOnly: /[a-zA-Z]/,
        alphanumeric: /[a-zA-Z0-9]/,
        email: /[a-z0-9!@#$%&'*+/=?^_`{|}~-]/,
        lettersAposHyphen: /[a-zA-Z'`-]/,
        lettersAposHyphenSpace: /[a-zA-Z\s'`-]/,
        nameCharacters: /[a-zA-Z\s'`-]/,
        numeric: /[0-9]/,
        odometer: /[0-9]/,
        password: /[a-zA-Z0-9!@#$_-]/,
        phone: /[0-9\(\)-\s]/,
        postalCode: /[0-9]/,
    },
    delimCharacters: {
        postalCode: { delim: /\s|-/g }
    },
    formatCharacters: {
        postalCode: { mask: /(\d{5})(\d{4})/, rep: "$1-$2" }
    },
    postalCode: {
        pattern: /\d{5}(?:[-\s]\d{4})?$/,
        mask: [/(\d{5})(\d{4})/, "$1-$2"]
    },
    state: {
        pattern: /^[a-zA-Z]{2,}$/,
        allowed: /(AL|AK|AZ|AR|CA|CO|CT|DC|DE|FL|GA|HI|ID|IL|IN|IA|KS|KY|LA|ME|MD|MA|MI|MN|MS|MO|MT|NE|NV|NH|NJ|NM|NY|NC|ND|OH|OK|OR|PA|RI|SC|SD|TN|TX|UT|VT|VA|WA|WV|WI|WY|al|ak|az|ar|ca|co|ct|dc|de|fl|ga|hi|id|il|in|ia|ks|ky|la|me|md|ma|mi|mn|ms|mo|mt|ne|nv|nh|nj|nm|ny|nc|nd|oh|ok|or|pa|ri|sc|sd|tn|tx|ut|vt|va|wa|wv|wi|wy)/
    },
		email: {
			pattern: /(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/
		}

};
