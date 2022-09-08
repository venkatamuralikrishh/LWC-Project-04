public class ContactRelationUpdateHandler {
    
    public void updateRecord(List<Contact_Relationship__c> crList1) {
        
        set<Id> Idset = new set<Id>();
        Map<Id,String> map1 = new Map<Id,String>();
        for(Contact_Relationship__c cr1 : crList1) {
            Idset.add(cr1.OwnerId);
        }
        List<User> uList = [SELECT Id, Name from User WHERE Id in:Idset];
        for(User u : uList) {
            map1.put(u.Id, u.Name);
        }
        for(Contact_Relationship__c cr : crList1) {
            cr.Name = map1.get(cr.OwnerId);
        }
    }
}