public class wireExample01 {
    @AuraEnabled(cacheable=true)
    public static List<Account> methodName(){
            List<Account> accList = [SELECT Id,Name from Account LIMIT 10];
            return accList;
    }
}