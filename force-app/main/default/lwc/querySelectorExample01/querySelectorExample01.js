import { LightningElement } from 'lwc';

export default class QuerySelectorExample01 extends LightningElement {
    display(event){
        var e = this.template.querySelector('.d');
        e.style.color='green';
    }
}