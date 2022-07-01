trigger caseTrigger on Case (before insert) {
    if(trigger.isInsert && trigger.isBefore){
        CaseTriggerHandler.updateNewCase(trigger.new);
    }
}