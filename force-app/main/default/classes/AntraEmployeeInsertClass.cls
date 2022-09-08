public class AntraEmployeeInsertClass {
    public String Ename{get;set;}
    public String Email{get;set;}
    public Double Esalary{get;set;}
    public String Ephone{get;set;}
    public string msg1{get;set;}
    public string msg2{get;set;}
    public void save() {
        
        Integer count = [SELECT COUNT() from Antra_Employee__c WHERE 
                         Name=:Ename];
        if(count>0){
            msg2 = 'sorry record already existed, you cant insert.';
            msg1 = null;
        }
        else{
            Antra_Employee__c a1 = new Antra_Employee__c();
            a1.Name = Ename;
            a1.Employee_Email__c = Email;
            a1.Employee_Phone__c = Ephone;
            a1.Employee_Salary__c = Esalary;
            insert a1;
            msg1 = 'record inserted';
            msg2 = null;
        }
    }
}