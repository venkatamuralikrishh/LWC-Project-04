public class AccountComboBoxClass {
	@AuraEnabled
    public static List<Account> getAccountDetails() {
        List<Account> accList1 = [SELECT Name from Account];
        return accList1;
    }
    @AuraEnabled
    public static List<Account> fetchData(String nm) {
        List<Account> accList2 = [SELECT Name from Account WHERE Name=:nm];
        return accList2;
    }
}