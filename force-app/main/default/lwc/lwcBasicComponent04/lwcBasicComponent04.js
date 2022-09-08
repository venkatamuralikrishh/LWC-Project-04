import { LightningElement } from 'lwc';

export default class LwcBasicComponent04 extends LightningElement {
    contacts=[
        {
            Id:1,
            Name:'Murali',
            Email:'murali@gmail.com'
        },
        {
            Id:2,
            Name:'Teja',
            Email:'Teja@gmail.com'
        },
        {
            Id:3,
            Name:'Nagendra',
            Email:'Nagendra@gmail.com'
        },
    ];
    constructor(){
        super();
        console.log(typeof(contacts));
    }
}