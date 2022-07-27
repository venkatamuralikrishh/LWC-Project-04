import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Practice extends LightningElement {
    
    
    showToast() {
    const event = new ShowToastEvent({
        title: 'Example 01',
        message: 'Hi this is murali',
        variant: 'success',
        mode: 'dismissable'
    });
    this.dispatchEvent(event);
    }

}