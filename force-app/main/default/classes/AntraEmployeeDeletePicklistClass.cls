public class AntraEmployeeDeletePicklistClass {
    public String listOfEmp{get;set;}
    public String msg{get;set;}
    
    
    public List<SelectOption> getpicklist() {
        
        List<SelectOption> picklist = new List<SelectOption>();
        List<Antra_Employee__c> ae = [SELECT Name from Antra_Employee__c];
        picklist.add(new SelectOption('-None-','-None-'));
        for(Antra_Employee__c ae1:ae) {
            picklist.add(new SelectOption(ae1.Name,ae1.Name));
        }
        return picklist;
    }
    public void deleterecords() {
        Integer count = [SELECT count() from Antra_Employee__c WHERE Name=:listOfEmp];
        if(count>0) {
            List<Antra_Employee__c> delList = [SELECT Name from Antra_Employee__c WHERE Name=:listOfEmp];
            delete delList;
            msg = 'record deleted successfully';
        }
        else {
            msg = 'record not exists';
        }
    }
}