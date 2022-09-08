trigger ContactTrigger on Contact (after update, after insert, after delete, after undelete, before insert, before update, before delete) {
    if(trigger.isUpdate && trigger.isAfter && ContactTriggerHandler.isTrigger){
        ContactTriggerHandler.updateAccountDescription(trigger.new);
        ContactTriggerHandler.updateCountOfContactsOnUpdate(trigger.new,trigger.oldmap);
        ContactTriggerHandler.updateAmountInAccountOnContactInsert(trigger.new);
        ContactTriggerHandler.isTrigger=false;
    }
    if(trigger.isInsert && trigger.isAfter && ContactTriggerHandler.isTrigger){
        ContactTriggerHandler.updateAccountDescriptionOnContactInsert(trigger.new);
        ContactTriggerHandler.updateCountOfContactsOnInsert(trigger.new);
        ContactTriggerHandler.updateAmountInAccountOnContactInsert(trigger.new);
        ContactTriggerHandler.isTrigger=false;
    }
    if(trigger.isDelete && trigger.isAfter){
        ContactTriggerHandler.updateCountOfContactsOnDelete(trigger.old);
    }
    if(trigger.isUndelete && trigger.isAfter){
        ContactTriggerHandler.updateCountOfContactsOnUndelete(trigger.new);
    }
}