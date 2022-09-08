public class Top_X_DesignationExampleHandler {
    
    public void updateOppty(List<Top_X_Designation__c> topList) {
        
        Set<Id> idSet = new Set<Id>(); // Getting Id's of Opportunities from Top X Designation records
        for(Top_X_Designation__c td : topList) {
            if(td.Opportunity__c != null) {
                idSet.add(td.Opportunity__c);
            }
        }
        // Getting records of Opportunities whose Id's are in idSet
        List<Opportunity> oppList = [SELECT Name, Handoff_Attached__c from Opportunity WHERE id in : idSet];
        
        List<Opportunity> oppList2 = new List<Opportunity>();
        
        for(Top_X_Designation__c td : topList) {
            if((td.Type__c == 'Contract Flowdown' || td.Type__c == 'Handoff') && 
               td.Document_Attached__c == true) {
                   for(Opportunity op : oppList) {
                       
                       op.Handoff_Attached__c = 'Yes';
                       oppList2.add(op);
                   }
               }
            else {
                for(Opportunity op : oppList) {
                    op.Handoff_Attached__c = 'No';
                    oppList2.add(op);
                }
            }
        }
        update oppList2;
    }
}