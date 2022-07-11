trigger employeeTrigger on Employee__c (after insert) {
    if(trigger.isInsert && trigger.isAfter){
        EmployeeTriggerHandler.updateRecord(trigger.newMap);
    }
}