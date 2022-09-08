@isTest
private class ApexExample02Test {
	@testSetup
    private static void createData(){
        Opportunity op = new Opportunity();
        op.Name='test oppty';
        op.StageName='Prospecting';
        op.CloseDate=Date.newInstance(2022, 04, 20);
        insert op;
    }
    @isTest
    private static void callme(){
        ApexExample02 ae = new ApexExample02();
        ae.callMe();
        Opportunity oppty = [SELECT id,stageName from Opportunity];
        System.assertEquals('Closed Won', oppty.StageName, 'test failed');
    }
    @isTest
    private static void callme2(){
        ApexExample02 ae = new ApexExample02();
        ae.show();
		Integer count = [SELECT count() from Opportunity];  
        System.assertEquals(0,count,'test failed');
    }
}