import { LightningElement, track } from 'lwc';

export default class Lwc_2407_greater3NumbersUsingQuerySelectorAll extends LightningElement {
    @track fnum;
    @track snum;
    @track tnum;
    changeHandler(e){
        if(e.target.name == 'fno'){
            this.fnum = e.target.value;
        }
        if(e.target.name == 'sno'){
            this.snum = e.target.value;
        }
        if(e.target.name == 'tno'){
            this.tnum = e.target.value;
        }
        console.log(this.fnum, this.snum, this.tnum);
    }
    handleClick(){
        if(this.fnum > this.snum && this.fnum > this.tnum){
            alert('Highest Number is '+ this.fnum);
        }
        if(this.snum > this.fnum && this.snum > this.tnum){
            alert('Highest Number is '+ this.snum);
        }
        if(this.tnum > this.fnum && this.tnum > this.snum){
            alert('Highest Number is '+ this.tnum);
        }
        /*
        var nodeslist = template.querySelectorAll('lightning-input');
        nodeslist.forEach(function(element){
            if(element.name == 'fno'){
                this.fnum = element.value;
            }
            if(element.name == 'sno'){
                this.snum = element.value;
            }
            if(element.name == 'tno'){
                this.tnum = element.value;
            }
            console.log(this.fnum, this.snum, this.tnum);
            if(fnum>snum && fnum>tnum){
                alert('Highest Number is '+fnum);
            }
            if(snum>fnum && snum>tnum){
                alert('Highest Number is '+snum);
            }
            if(tnum>fnum && tnum>snum){
                alert('Highest Number is '+tnum);
            }
        })
        */
    }
}