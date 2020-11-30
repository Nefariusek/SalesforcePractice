import { LightningElement, api } from 'lwc';

const columns = [
    { label: 'Request', fieldName: 'request', type: 'text' },
    { label: 'Response', fieldName: 'response', type: 'text' },
    { label: 'Status Code', fieldName: 'statusCode', type: 'number' }
];

export default class EventTable extends LightningElement {
    @api logsArr;
    columns = columns;

    handleChange(event) {
        this.logsArr = logsArr;
    }
}