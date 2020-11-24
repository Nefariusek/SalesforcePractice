import { LightningElement, api, track, wire } from 'lwc';
import getRecords from '@salesforce/apex/LwcLookupController.getRecords';

export default class Lookup extends LightningElement {
    @api objectName;
    @api titleOfRecord;
    @api fieldsOfRecord;
    @api selectedName;
    @api selectedRecordId;
    @track inputString = '';
    @track recordsList;
    message;
    fieldsOfRecordArr = fieldsOfRecord.split(',');

    handleInput(event) {
        const inputString = event.target.value;
        this.inputString = inputString;
        this.getLookupResult();
    }

    onLeave(event) {
        setTimeout(() => {
            this.inputString = '';
            this.recordsList = null;
        }, 500);
    }

    getLookupResult() {
        getRecords({
            searchString: this.inputString,
            objectName: this.objectName,
            fieldsName: this.titleOfRecord + ',' + this.fieldsOfRecord
        })
            .then((result) => {
                if (result.length === 0) {
                    this.recordsList = [];
                    this.message = 'No Records Found';
                } else {
                    this.recordsList = result;
                    this.message = '';
                }
                this.error = undefined;
            })
            .catch((error) => {
                this.error = error;
                this.recordsList = undefined;
            });
    }

    removeRecordOnLookup(event) {
        this.selectedRecordId = null;
        this.selectedName = null;
        this.inputString = '';
        this.recordsList = null;
        this.sendSelectedRecordToParent();
    }

    onRecordSelection(event) {
        this.selectedRecordId = event.currentTarget.dataset.recordid;
        this.selectedName = event.currentTarget.dataset.name;
        this.inputString = '';
        this.sendSelectedRecordToParent();
    }

    sendSelectedRecordToParent() {
        const idOfRecordToParent = new CustomEvent('change', {
            detail: { selectedRecordId: this.selectedRecordId }
        });
        this.dispatchEvent(idOfRecordToParent);
    }
}
