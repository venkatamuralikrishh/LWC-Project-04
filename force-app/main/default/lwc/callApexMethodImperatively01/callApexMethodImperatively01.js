import { LightningElement } from 'lwc';
import getContactList from '@salesforce/apex/AccountController.getContactList';

export default class CallApexMethodImperatively01 extends LightningElement {
    contacts;
    clickHandler(){
        getContactList().then(result=>{
            this.contacts=result;
        }).catch(error=>{
            console.log(error);
        })
    }
}