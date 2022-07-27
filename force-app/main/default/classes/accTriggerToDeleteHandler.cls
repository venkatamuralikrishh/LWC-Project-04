public with sharing class accTriggerToDeleteHandler {

    public static void deleteAccRecord(Map<Id,Account> accOldMap, Map<Id,Account> accNewMap){

		List<Account> accOld = accOldMap.values();

		List<Account> accToDelete = new List<Account>();

    for(Account acc : accOld){
			if(acc.Type != accNewMap.get(acc.Id).Type){
				accToDelete.add(acc);
			}
		}
        List<Account> accList = [SELECT Id from Account WHERE ID IN : accToDelete];
	delete accList;
	}
}
