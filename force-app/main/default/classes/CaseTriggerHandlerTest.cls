@isTest
private with sharing class CaseTriggerHandlerTest {
    @isTest
    private static void checkMe(){
        List<Case> caseList = new List<Case>();
        Case c = new Case();
        c.Origin='Email';
        c.Status='Escalated';
        caseList.add(c);
        Test.startTest();
        CaseTriggerHandler.updateNewCase(caseList);
        Test.stopTest();
        List<Case> newCaseList = [SELECT Status,Priority from Case];
        for(Case ca : newCaseList){
            System.assertEquals('New', ca.Status, 'status failed');
            System.assertEquals('Medium', ca.Priority, 'Priority failed');
        }
    }
}