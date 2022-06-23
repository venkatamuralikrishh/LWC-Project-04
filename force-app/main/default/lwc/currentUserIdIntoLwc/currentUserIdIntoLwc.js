import { LightningElement } from 'lwc';
import USER_ID from '@salesforce/user/Id';

export default class CurrentUserIdIntoLwc extends LightningElement {
    userId=USER_ID;
}