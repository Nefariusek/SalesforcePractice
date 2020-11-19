import { LightningElement, api, track } from 'lwc';

export default class TextArea extends LightningElement {
    @api label;
    @api rows;
    @api cols;
    @api placeholder;
    @track value;
    valueRet = '';

    handleChange(event) {
        this.valueRet = event.target.value;
        console.log('SZPAK value child', this.valueRet);
        const lwcEvent = new CustomEvent('change', {
            detail: { textAreaContent: this.valueRet }
        });
        console.log('SZPAK event');
        console.log(lwcEvent);
        this.dispatchEvent(lwcEvent);
    }
}
