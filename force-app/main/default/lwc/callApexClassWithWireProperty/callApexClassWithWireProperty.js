import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';
export default class CallApexClassWithWireProperty extends LightningElement {

    @wire(getAccounts)
    wiredAccounts;
}