import { LightningElement, track } from 'lwc';
import methodName from '@salesforce/apex/imperativeExample01.methodName';
import insertAccount from '@salesforce/apex/imperativeExample01.insertAccount';

export default class ImperativeExample01 extends LightningElement {
    accounts;
    err;
    nm='';
    accId='';
    err2;
    status=false;
    clickHandler(){
        methodName()
        .then((result)=>{
            this.accounts=result;
        })
        .catch((error)=>{
            this.err=error;
        })
    }
    handleChange(event){
        this.nm=event.target.value;
    }
    insertRecord(){
        insertAccount({accName:this.nm})
        .then((result)=>{
            this.accId=result;
            this.status=true;
        })
        .catch((error)=>{
            this.err2=error;
            this.status=false;
        })
    }
}