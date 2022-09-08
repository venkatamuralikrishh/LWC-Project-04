trigger CustomerInfoTrigger on Customer_Info__c (before insert) {
    if(trigger.isBefore && trigger.isInsert){
        CustomerInfoTriggerHandler.updateCustomerInfo(trigger.new);
    }
}