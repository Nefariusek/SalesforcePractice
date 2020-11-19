import { LightningElement, track } from 'lwc';

export default class ParentForTextArea extends LightningElement {
    @track textAreaContent;

    handleChange(event) {
        this.textAreaContent = event.detail.textAreaContent;
        console.log('SZPAK this.textAreaContent ', this.textAreaContent);
    }
}
