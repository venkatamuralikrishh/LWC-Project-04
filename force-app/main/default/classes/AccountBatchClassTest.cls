@isTest
private class AccountBatchClassTest {
    @isTest
    static void executeTest() {
        List<Account> acc = new List<Account>();
        
        for(Integer i=0;i<0;i++) {
            Account ao = new Account();
            ao.Name = 'Antra'+i;
            ao.Type = 'Customer - Direct';
            acc.add(ao);
        }
        Test.startTest();
        insert acc;
        AccountBatchClass abc = new AccountBatchClass();
        Database.executeBatch(abc);
        Test.stopTest();
        
        List<Account> accList = [SELECT Name,Type from Account WHERE Type = 'Customer - Direct'];
        System.assert(accList.isEmpty() == true, 'Test Failed');
    }
}