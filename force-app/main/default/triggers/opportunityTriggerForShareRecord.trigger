trigger opportunityTriggerForShareRecord on Opportunity (after update) {

    if(trigger.isAfter && trigger.isUpdate){
        opportunityTriggerForShareRecordHandler.shareRecord(trigger.newMap, trigger.oldMap);
    }
}