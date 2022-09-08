import { LightningElement } from 'lwc';

export default class LwcBasicComponent01 extends LightningElement {
    
    name;
    changeHandler(event){
        this.name=event.detail.value;
    }
}