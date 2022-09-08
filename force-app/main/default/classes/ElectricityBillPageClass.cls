public class ElectricityBillPageClass {
    public Integer srno{get;set;}
    public Integer erno{get;set;}
    public String billAmount{get;set;}
    public Integer result1{get;set;}
    public String result2{get;set;}
    
    public void payBill() {
        if(erno>srno) {
            if(billAmount == 'c') {
                result1 = (erno-srno)*4;
                result2 = null;
            }
            if(billAmount == 'i') {
                result1 = (erno-srno)*5;
                result2 = null;
            }
            if(billAmount == 'r') {
                result1 = (erno-srno)*3;
                result2 = null;
            }
        }
        else {
            result1 = null;
            result2 = 'Sorry, Ending reading number should be greater than starting reading number';
        }
        
    }
}