trigger ContactRelationUpdate on Contact_Relationship__c (before update) {
    if(Trigger.isBefore && Trigger.isUpdate) {
        ContactRelationUpdateHandler cru = new ContactRelationUpdateHandler();
        cru.updateRecord(Trigger.new);
    }
}