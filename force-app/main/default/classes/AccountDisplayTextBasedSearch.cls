public class AccountDisplayTextBasedSearch {
    @AuraEnabled
    public static List<Account> getDataFromDatabase(String name) {
        String a = name+'%';
        List<Account> accList = [SELECT Name from Account WHERE Name LIKE :a];
        return accList;
    }
}