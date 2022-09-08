public class LeadExtensionSelectClass {
    public Lead l1;
    public Lead l2{get;set;}
    public String msg{get;set;}
    
    public LeadExtensionSelectClass(ApexPages.StandardController l) {
        sObject obj = l.getRecord();
        if(obj!=null) {
            l1 = (Lead)obj;
        }
    }
    
    public Void selectRecord() {
        l2 = [SELECT Name from Lead WHERE Name=:l1.Name LIMIT 1];
        
    }
}