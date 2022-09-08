@isTest
private class AccountContactRecordHandlerTest {
	@isTest
    static void CreateContactTest() {
        Integer i;
        List<Account> accList = new List<Account>();
        for(i=0;i<400;i++) {
            Account acc = new Account();
            acc.Name = 'Antra'+i;
            acc.Type = 'Prospect';
            accList.add(acc);
        }
        insert accList;
        Set<Id> idList = new Set<Id>();
        for(Account a : accList) {
            idList.add(a.Id);
        }
        Test.startTest();
        List<Contact> conList = [SELECT lastName from contact WHERE id in : idList];
        Test.stopTest();
        System.assert(!conList.isEmpty(), 'Test Failed');
        
    }
}