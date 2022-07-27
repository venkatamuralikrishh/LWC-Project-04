trigger accTriggerToDelete on Account (after update) {
    
    if(trigger.isAfter && trigger.isUpdate){
		accTriggerToDeleteHandler.deleteAccRecord(trigger.oldMap, trigger.newMap);
	}
}


