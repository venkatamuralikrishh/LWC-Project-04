public with sharing class wireExample02 {
    @AuraEnabled(cacheable=true)
    public static List<Account> methodName(){
        List<Account> accList = [SELECT Id,Name from Account];
        return accList;
    }
}