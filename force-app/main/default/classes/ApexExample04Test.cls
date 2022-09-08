@istest
private class ApexExample04Test {
	@testSetup
    static void create(){
        Account a = new Account();
        a.Name='testing';
        insert a;
    }
    @isTest
    static void testMe(){
        ApexExample04 ae = new ApexExample04();
        Database.executeBatch(ae);
        Account a = [SELECT Name, ownerId from Account];
        User u = [SELECT id from User WHERE alias='mkris'];
        System.assertEquals(u.Id, a.OwnerId, 'test failed');
    }
}