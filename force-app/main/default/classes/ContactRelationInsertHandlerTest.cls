@isTest
private class ContactRelationInsertHandlerTest {
    @isTest
    private static void check(){
        Test.startTest();
        List<Contact> conList = new List<Contact>();
        Contact con = new Contact();
        con.lastName = 'Dheeraj 012345';
        con.Contact_Relationship__c = true;
        conList.add(con);
        ContactRelationInsertHandler.createRecord(conList);
        List<Contact_Relationship__c> cr = [SELECT Name from Contact_Relationship__c WHERE Name='Dheeraj 012345'];
        Test.stopTest();
        System.assertEquals(1, cr.size(), 'Failed');
        
    }
}