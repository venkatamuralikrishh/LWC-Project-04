global class AccountBatchClass implements Database.Batchable<sObject>{
    //batch apex class
    global Database.QueryLocator start(Database.BatchableContext bc) {
        String s = 'SELECT Name,Type from Account WHERE Type=\'Customer - Direct\'';
        return Database.getQueryLocator(s);
    }
    global void execute(Database.BatchableContext bc, List<Account> acc) {
        for(Account a : acc) {
            a.Type = 'Prospect';
        }
        update acc;
    }
    global void finish(Database.BatchableContext bc) {
        
    }
}