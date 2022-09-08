public class imperativeExample01 {
    @AuraEnabled
    public static List<Account> methodName(){
        List<Account> accList = [SELECT Id,Name from Account];
        return accList;
    }
    @AuraEnabled
    public static string insertAccount(String accName){
        try {
            Account a = new Account();
            a.Name=accName;
            insert a;
            return a.Id;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}