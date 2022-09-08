public class AntraEmployeeDisplayPageClass {
    public String ename{get;set;}
    public Antra_Employee__c ae{get;set;}
    
    public void SearchRecord() {
        Antra_Employee__c ae = [SELECT Id,Name,Employee_Email__c,Employee_Phone__c,Employee_Salary__c
                                from Antra_Employee__c WHERE Name=:ename];
        
    }
}