@istest
private class ApexExample03Test {
	@testSetup
    private static void create(){
        User u = [SELECT id from user where alias='mkris' LIMIT 1];
        Opportunity op = new Opportunity();
        op.Name='test oppty';
        op.StageName='Prospecting';
        op.CloseDate=Date.newInstance(2022, 01, 15);
        op.OwnerId=u.Id;
        insert op;
    }
    @isTest
    private static void callMe(){
        ApexExample03 ae = new ApexExample03();
        ae.callMe();
        Opportunity op = [SELECT id,stageName,closeDate from Opportunity];
        System.assertEquals('Closed Won', op.StageName, 'test failed');
        System.assertEquals(system.today(), op.CloseDate, 'test failed');
    }
    @isTest
    private static void callMe2(){
        ApexExample03 ae = new ApexExample03();
        ae.show();
        Integer count = [SELECT count() from Opportunity];
        System.assertEquals(0, count, 'test failed');
    }
}