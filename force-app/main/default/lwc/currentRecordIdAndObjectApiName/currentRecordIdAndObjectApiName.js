import { LightningElement,api } from 'lwc';

export default class CurrentRecordIdAndObjectApiName extends LightningElement {
    @api recordId;
    @api objectApiName;
}