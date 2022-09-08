trigger AccountTriggerTaskCreation on Account (after update) {

    if(trigger.isAfter && trigger.isUpdate){
        AccountTriggerTaskCreationHandler.createTask(trigger.new, trigger.oldMap);
    }
}