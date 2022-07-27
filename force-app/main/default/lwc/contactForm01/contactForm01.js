import { LightningElement } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import FIRST_NAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LAST_NAME_FIELD from '@salesforce/schema/Contact.LastName';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import DOB_FIELD from '@salesforce/schema/Contact.Birthdate';


export default class ContactForm01 extends LightningElement {
    contactObject = CONTACT_OBJECT;
    myFields = [FIRST_NAME_FIELD, LAST_NAME_FIELD, EMAIL_FIELD, DOB_FIELD];    
}