public class AntraEmployeeTextBasedController {
	
    public String name{get;set;}
    public Double salarymin{get;set;}
    public Double salarymax{get;set;}
    public String email{get;set;}
    public List<Antra_Employee__c> ae{get;set;}
    public Set<Antra_Employee__c> ae2{get;set;}
    
    public AntraEmployeeTextBasedController(){
        ae = [SELECT Name, Employee_Salary__c, Employee_Email__c from Antra_Employee__c];
        ae2 = new Set<Antra_Employee__c>();
    }
    public void search() {
        ae2.clear();
        for(Antra_Employee__c a :ae) {
            if(name!='') {
                if(a.Name.startsWith(name)) {
                    ae2.add(a);
                }
            }
            if(email!='') {
                if(a.Employee_Email__c.startsWith(email)) {
                    ae2.add(a);
                }
            }
            if((salarymin!=0) && (salarymax!=0)) {
                if((a.Employee_Salary__c > salarymin) && (a.Employee_Salary__c < salarymax)) {
                    ae2.add(a);
                }
            }
        }
    }
}