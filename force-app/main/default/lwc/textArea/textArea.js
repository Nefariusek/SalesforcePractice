import { LightningElement, api } from 'lwc';

export default class TextArea extends LightningElement {
    @api label;
    @api rows;
    @api cols;
    @api placeholder;
    textAreaContent;

    handleChange(event) {
        this.textAreaContent = event.target.value;
        const lwcEvent = new CustomEvent('change', {
            detail: { textAreaContent: this.textAreaContent }
        });
        this.dispatchEvent(lwcEvent);
    }
}
