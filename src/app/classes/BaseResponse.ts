export class BaseResponse {
    messages?: any;
    error?: any;
    data?: any;

    constructor(
        messages: any,
        error: any,
        data: any

    ) {
        this.messages = messages;
        this.error = error;
        this.data = data;
    }
}