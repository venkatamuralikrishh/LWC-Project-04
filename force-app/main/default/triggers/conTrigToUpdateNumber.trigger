trigger conTrigToUpdateNumber on Contact (after insert) {
    if(trigger.isInsert && trigger.isAfter){
        conTrigToUpdateNumberHandler.updateParentAccount(trigger.newMap);
    }
}