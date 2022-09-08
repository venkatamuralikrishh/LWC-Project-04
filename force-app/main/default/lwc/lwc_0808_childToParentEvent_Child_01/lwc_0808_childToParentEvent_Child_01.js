import { LightningElement,wire } from 'lwc';
import getAccounts from '@salesforce/apex/Lwc_0708_deleteRecordWithOutApexHandler.getAccounts';

export default class Lwc_0808_childToParentEvent_Child_01 extends LightningElement {
    accounts;
    @wire(getAccounts) accounts;
    
    clickHandler(evt){
        const event = new CustomEvent('send',{
            detail : {
                accounts : this.accounts
            }
        })
        this.dispatchEvent(event);
    }
}