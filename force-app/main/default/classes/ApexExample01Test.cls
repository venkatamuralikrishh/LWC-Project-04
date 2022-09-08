@isTest
private class ApexExample01Test {
	@isTest
    private static void callMe(){
        ApexExample01 ae = new ApexExample01();
        ae.name='testing opportunity';
        ae.closeDate=system.today();
        ae.stName='prospect';
        ae.insertMethod();
        Opportunity op = [SELECT Name from Opportunity];
        System.assertEquals('testing opportunity',op.Name, 'testing failed');
    }
}