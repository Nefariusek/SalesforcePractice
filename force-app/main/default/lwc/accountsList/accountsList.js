import { LightningElement, track } from 'lwc';

export default class AccountsList extends LightningElement {
    @track textAreaContent;

    handleChange(event) {
        this.textAreaContent = event.detail.textAreaContent;
        console.log('SZPAK this.textAreaContent ', this.textAreaContent);
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
