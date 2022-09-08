global class ApexExample04 implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'SELECT id,ownerId from Account';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc, List<Account> acc){
        User u = [SELECT id from user where alias='mkris'];
        for(Account a : acc){
            a.OwnerId = u.Id;
        }
        update acc;
    }
    global void finish(Database.BatchableContext bc){
        
    }
}