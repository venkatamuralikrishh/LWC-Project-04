public with sharing class contactTriggerIsActiveHandler {
    
    public static void checkMe(List<Contact> newConList){
        Set<Id> accIds = new Set<Id>();
        for(Contact con : newConList){
            if(con.AccountId != null){
                accIds.add(con.AccountId);
            }
        }
        List<Account> accList = [SELECT Id, (SELECT Id, isActive__c from Contacts), isActive__c  from Account where id in : accIds];
        for(Account a : accList){
            for(Contact c : a.Contacts){
                if(c.isActive__c==true){
                    a.isActive__c=true;
                }
                else{
                    a.isActive__c=false;
                }
            }
        }
        update accList;
    }
}
