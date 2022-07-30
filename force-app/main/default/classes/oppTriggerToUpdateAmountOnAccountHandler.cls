public with sharing class oppTriggerToUpdateAmountOnAccountHandler {
    /*
    public static void updateAccounts(Map<Id, Opportunity> oldMap, Map<Id, Opportunity> newMap){
        List<Opportunity> newList = newMap.values();
        Set<Id> accIds = new Set<Id>();
        for(Opportunity op : newList){
            if(op.StageName != oldMap.get(op.Id).StageName && op.StageName == 'closed won'){
                accIds.add(op.AccountId);
            }
        }

        Map<Id, List<Opportunity>> newMapOfOpp = new Map<Id, List<Opportunity>>();
        

        List<Account> accList = [SELECT Id, (SELECT Id, Amount from Opportunities),Total_Amount__c from Account WHERE ID IN : accIds];

        for(Account acc : accList){
            acc.Total_Amount__c = 0;
            for(Opportunity op : acc.Opportunities){
                acc.Total_Amount__c = acc.Total_Amount__c + op.Amount;
            }
        }
        update accList;
    }
    */
    public static void updateAccounts(Map<Id, Opportunity> oldMap, Map<Id, Opportunity> newMap){
        List<Opportunity> newList = newMap.values();

        Map<Id, List<Opportunity>> newMapOfOpp = new Map<Id, List<Opportunity>>();

        Set<Id> accIds = new Set<Id>();

        for(Opportunity op : newList){
            if(op.StageName != oldMap.get(op.Id).StageName){
                //newMapOfOpp.put(op.AccountId, op);
                accIds.add(op.AccountId);
            }
        }
        List<Account> accList = [SELECT Id,Total_Amount__c from Account WHERE ID IN : accIds];
        
        
        for(Account acc : accList){
            acc.Total_Amount__c = 0;
            for(Opportunity op : acc.Opportunities){
                acc.Total_Amount__c = acc.Total_Amount__c + op.Amount;
            }
        }
        update accList;
    }
}
