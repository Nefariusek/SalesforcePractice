import { LightningElement } from 'lwc';

export default class ParentForTextArea extends LightningElement {
    textAreaContent;

    handleChange(event) {
        this.textAreaContent = event.detail.textAreaContent;
    }
}
