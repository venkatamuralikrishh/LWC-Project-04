import { LightningElement } from 'lwc';

export default class LwcBasicComponent05 extends LightningElement {
    fnm='';
    snm='';
    handleChange(event){
        if(event.target.name=='input1'){
            this.fnm=event.target.value;
        } else if(event.target.name='input2'){
            this.snm=event.target.value;
        }
    }
    get fullName(){
        return `${this.fnm} ${this.snm}`;
    }
}