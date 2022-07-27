import { LightningElement } from 'lwc';

export default class LifeCycleHooksParent01 extends LightningElement {
    
    //construtor, connected call back, rendered callback

    constr;
    connCall;
    renderCall;

    constructor(){
        super();
        this.constr = 'this is inside constructor';
        console.log('this is inside constructor');
    }

    connectedCallback(){
        this.connCall = 'this is inside connected call back';
        console.log('this is inside connected call back');
    }

    renderedCallback(){
        this.renderCall = 'this is inside rendered call back';
        console.log('this is inside rendered call back');
    }

    disconnectedCallback(){
        console.log('this is inside disconnected call back');
    }
}