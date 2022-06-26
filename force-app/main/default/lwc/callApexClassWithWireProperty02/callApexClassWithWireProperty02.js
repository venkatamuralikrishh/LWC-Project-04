import { LightningElement, wire } from 'lwc';
import getAccountsByName from '@salesforce/apex/AccountController.getAccountsByName';

export default class CallApexClassWithWireProperty02 extends LightningElement {
    nameOfAccount;
    changeHandler(event){
        this.nameOfAccount=event.detail.value;
    }
    @wire(getAccountsByName, {nm : '$nameOfAccount'})
    wiredAccounts
}