trigger PotentialCustomerTrigger on Potential_Customer__c (after insert) {
    if(trigger.isAfter && trigger.isInsert) {
        PotentialCustomerTriggerHandler.sendEmailToManager(trigger.new);
    }
}