import { LightningElement } from 'lwc';

export default class LwcBasicComponent02 extends LightningElement {
    fnm='';
    snm='';
    changeHandler(event){
        checkHandler();
        const nm=event.target.name;
        if(nm=='fname'){
            this.fnm=event.target.value;
        }
        else if(nm=='sname'){
            this.snm=event.target.value;
        }
    }
    get fullName(){
        return `${this.nm}${this.snm}`;
    }
}