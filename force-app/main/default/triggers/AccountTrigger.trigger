trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    if(Trigger.isInsert && Trigger.isBefore) {
        AccountTriggerHandler ath = new AccountTriggerHandler();
        ath.duplicateAccount(Trigger.new);
        ath.updateHelloField(Trigger.new);
    }
    if(Trigger.isUpdate && Trigger.isBefore) {
        AccountTriggerHandler ath = new AccountTriggerHandler();
        ath.updateHelloField(Trigger.new);
        AccountTriggerHandler.checkName(Trigger.new,trigger.old);
    }
    if(Trigger.isAfter && Trigger.isUpdate) {
        AccountTriggerHandler.updateContactEmailField(Trigger.new);
        AccountTriggerHandler.updateContactMailAddress(Trigger.new,trigger.oldMap);
    }
    if(Trigger.isInsert && Trigger.isBefore) {
        AccountTriggerHandler.updateWebsiteField(Trigger.new);
        AccountTriggerHandler.checkRevenue(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isInsert) {
        AccountTriggerHandler.createContact(Trigger.new);
    }
    if(Trigger.isDelete && Trigger.isBefore) {
        AccountTriggerHandler.checkAccountIsActive(Trigger.old);
    }
    if(Trigger.isDelete && Trigger.isAfter) {
        AccountTriggerHandler.sendEmailToUser(Trigger.old);
    }
    if(Trigger.isUndelete && Trigger.isAfter) {
        AccountTriggerHandler.sendEmailToUserAfterUndelete(Trigger.new);
    }
}