public class AntraEmployeeSearchPageClass {
    public String selectname{get;set;}
    
    public PageReference deleteRecord() {
        Integer count = [SELECT Count() from Antra_Employee__c WHERE Name=:selectname];
        if(count>0) {
            List<Antra_Employee__c> ae1 = [SELECT Name from Antra_Employee__c WHERE Name=:selectname];
            delete ae1;
            PageReference pr = new PageReference('/apex/DeleteSuccessMessage');
            return pr; 
        }
        else {
            PageReference pr = new PageReference('/apex/DeleteFailureMessage');
            return pr;
        }
        
    }
}