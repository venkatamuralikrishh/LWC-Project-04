trigger RecursiveTrigger on Account (after insert) {
    if(trigger.isAfter && trigger.isInsert && RecursiveTriggerHandler.isTriggerRunning){
        RecursiveTriggerHandler.insertAccountRecord(trigger.new);
        RecursiveTriggerHandler.isTriggerRunning = false;
    }
}