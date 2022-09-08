trigger OpportunityTrigger on Opportunity (before insert, before update) {
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
        OpportunityTriggerHandler oth = new OpportunityTriggerHandler();
        oth.getData(Trigger.new);
    }
}