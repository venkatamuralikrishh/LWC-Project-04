@isTest
private with sharing class contactTriggerIsActiveHandlerTest {
    
    @isTest
    private static void checkMe(){
        //after insert
        Account acc1 = new Account();
        acc1.Name='dheeraj';
        acc1.isActive__c = false;
        insert acc1;

        Account acc = [SELECT Id, Name, isActive__c from Account WHERE name = 'dheeraj'];

        List<Contact> conList = new List<Contact>();

        Contact c = new Contact();
        c.lastName = 'salman';
        c.isActive__c = true;
        c.AccountId = acc.Id;
        conList.add(c);
        insert conList;
        contactTriggerIsActiveHandler.checkMe(conList);
        Account a = [SELECT Id, Name, isActive__c from Account WHERE name = 'dheeraj'];
        System.assertEquals(true, a.isActive__c);
    }
}
