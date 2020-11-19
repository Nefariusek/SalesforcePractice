import { LightningElement, api, track } from 'lwc';

export default class TextArea extends LightningElement {
    @api label;
    @api rows;
    @api cols;
    @api placeholder;
    @track value;

    handleChange(event) {
        console.log('MPYC event ', event);
        this.value = event.detail.value;
        console.log('MPYC this value', this.value);
        this.dispatchEvent(new CustomEvent('change', this.value));
    }
}
