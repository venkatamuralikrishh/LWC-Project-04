import { LightningElement } from 'lwc';

export default class LwcBasicComponent06 extends LightningElement {
    fullnm='';
    get fullName(){
        return this.fullnm;
    }
    set fullName(value){
        this.fullnm=value.toUpperCase();
    }
}