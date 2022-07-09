/*
    "Create 'isActive' checkbox field on Account & one on Contact Object (trigger)
    How to do This?
    1. Account.isActive should be marked true when ANY of its child Contacts have 'isActive' set as true.
    2. Account.isActive should be marked as false, when ALL of its child Contacts' 'isActive' are set as false."
*/

trigger contactTriggerIsActive on Contact (after insert,after update) {
    if((trigger.isInsert || trigger.isUpdate) && trigger.isAfter){
        contactTriggerIsActiveHandler.checkMe(trigger.new);
    }
}