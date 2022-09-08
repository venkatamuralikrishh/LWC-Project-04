trigger ContactRelationInsert on Contact (before update, before delete, after undelete, after insert, after delete) {
    if(Trigger.isBefore && Trigger.isUpdate) {
        ContactRelationInsertHandler cri = new ContactRelationInsertHandler();
        cri.createRecord(Trigger.new);
    }
    if(Trigger.isBefore && Trigger.isDelete) {
        ContactRelationInsertHandler cri = new ContactRelationInsertHandler();
        cri.deleteRecord(Trigger.old);
    }
    if(Trigger.isAfter && Trigger.isUndelete) {
        ContactRelationInsertHandler cri = new ContactRelationInsertHandler();
        cri.unDeleteRecord(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isInsert) {
        ContactRelationInsertHandler cri = new ContactRelationInsertHandler();
        cri.populateCountOnAccountAfterContactInsert(Trigger.new);
        cri.sendEmailToManager(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isDelete) {
        ContactRelationInsertHandler cri = new ContactRelationInsertHandler();
        cri.populateCountOnAccountAfterContactDelete(Trigger.old);
    }
}