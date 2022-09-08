public class AccountDisplay {
	@AuraEnabled
    public static List<Account> getAccountDataFromDatabase() {
        List<Account> accList = [SELECT Name, Type, BillingCity, ShippingCity, ParentId from Account];
        return accList;
    }
}