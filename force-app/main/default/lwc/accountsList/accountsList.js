import { LightningElement, track } from 'lwc';

export default class AccountsList extends LightningElement {
    @track textAreaInput = '';

    debugTextArea(event) {
        //this.textAreaInput = event.detail.value;;
        console.log('test ', this.textAreaInput);
    }

    handleChange(event) {
        this.textAreaInput = event.detail.value;
        console.log('MPYC this.textAreaInput ', this.textAreaInput);
    }

    @track
    contacts = [
        {
            Id: 1,
            Name: 'Amy Taylor',
            Title: 'VP of Engineering'
        },
        {
            Id: 2,
            Name: 'Michael Jones',
            Title: 'VP of Sales'
        },
        {
            Id: 3,
            Name: 'Jennifer Wu',
            Title: 'CEO'
        }
    ];
}
