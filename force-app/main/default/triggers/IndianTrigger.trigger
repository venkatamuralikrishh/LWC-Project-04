trigger IndianTrigger on Indian__c (before delete) {

    if(trigger.isDelete && trigger.isBefore){
        IndianTriggerHandler.deleteChildRecords(trigger.oldMap);
    }
}