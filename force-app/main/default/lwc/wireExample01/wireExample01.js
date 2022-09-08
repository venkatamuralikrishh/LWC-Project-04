import { LightningElement, wire } from 'lwc';
import methodName from '@salesforce/apex/wireExample01.methodName';

export default class WireExample01 extends LightningElement {
    @wire(methodName) 
    accounts;
    
}