trigger CustomerProject on Customer_Project__c (before insert, before update) {
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
        CustomerProjectHandler cph = new CustomerProjectHandler();
        cph.updateOpptyRecord(Trigger.new);
    }
}