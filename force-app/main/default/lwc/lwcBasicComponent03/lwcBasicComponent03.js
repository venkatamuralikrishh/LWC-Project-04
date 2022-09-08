import { LightningElement } from 'lwc';

export default class LwcBasicComponent03 extends LightningElement {
    condition=false;
    handleButton(){
        this.condition=true;
    }
}