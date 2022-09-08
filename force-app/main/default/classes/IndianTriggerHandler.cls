public with sharing class IndianTriggerHandler {
    
    public static void deleteChildRecords(Map<Id,Indian__c> oldMap){

        //before deleting the parent record the delete all the child records and then allow the deletion of parent record.
        Set<Id> oldIndIds = oldMap.keySet();
        List<pan_card__c> panList = [SELECT Id from pan_card__c where Indian__c In :oldIndIds];
        List<Database.DeleteResult> results = Database.delete(panList, false);
        for(Database.DeleteResult dr : results){
            if(dr.isSuccess()){
                system.debug(dr.getId());
            }
            else{
                for(Database.Error er : dr.getErrors()){
                    system.debug('error============>');
                    system.debug('get fields=====>'+er.getFields());
                    system.debug('get message=====>'+er.getMessage());
                }
            }
        }
    }
}