import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/Lwc_0708_deleteRecordWithOutApexHandler.getAccounts';

export default class ChildLwcInAura01 extends LightningElement {
    @wire(getAccounts) accounts;
    clickHandler(evt){
        const event = new CustomEvent('sendAccountId',{
            detail : {
                accountId : evt.target.dataset.accountId,
            }
        });
        this.dispatchEvent(event);
    }
}