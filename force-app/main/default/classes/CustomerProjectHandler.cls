public class CustomerProjectHandler {
    
    public void updateOpptyRecord(List<Customer_Project__c> cpList) {
        
        List<Id> idList = new List<Id>();
        
        for(Customer_Project__c cp : cpList) {
            
            if(cp.Status__c == 'Active') {
                idList.add(cp.Opportunity__c);
            }
        }
        List<Opportunity> op = [SELECT Id,Active_Customer_Project__c from Opportunity WHERE id in : idList];
        for(Opportunity o : op) {
            if(o.Active_Customer_Project__c == false) {
                o.Active_Customer_Project__c = true;
            }
        }
        update op;
    }
}