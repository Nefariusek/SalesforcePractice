import { LightningElement } from 'lwc';

export default class ParentForLookup extends LightningElement {
    selectedRecordId;

    handleChange(event) {
        this.selectedRecordId = event.detail.selectedRecordId;
    }
}
