public class OpportunityTriggerHandler {
    public void getData(List<Opportunity> opplist) {
        Set<Id> idlist = new Set<Id>();
        Set<Id> idlist2 = new Set<Id>();
        List<OpportunityContactRole> oppConRoleList;
        for(Opportunity o : opplist) {
            idList.add(o.Id);
        }
        Integer count = [SELECT count() from OpportunityContactRole WHERE OpportunityId in : idlist];
        if(count==0) {
            for(Opportunity o : opplist) {
                idlist2.add(o.AccountId);
            }
        }
        List<Contact> conList = [SELECT Name from Contact WHERE AccountId in : idlist2];
        for(Opportunity o : opplist) {
            for(Contact c : conList) {
                OpportunityContactRole conRole = new OpportunityContactRole();
                conRole.ContactId = c.Id;
                conRole.OpportunityId = o.Id;
                oppConRoleList.add(conRole);
               }
        }
        insert oppConRoleList;
    }
}