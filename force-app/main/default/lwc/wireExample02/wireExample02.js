import { LightningElement, wire } from 'lwc';
import methodName from '@salesforce/apex/wireExample02.methodName';

export default class WireExample02 extends LightningElement {
    accounts;
    err;
    @wire(methodName)
    wiredAccounts({data,error}){
        if(data){  
            this.accounts=data;
        }
        else{
            this.err=error;
        }
    }
}