@isTest
private class CustomerProjectHandlerTest {
    @isTest
    Static void updateOpptyRecordTest() {
        
        Test.startTest();
        List<Opportunity> oList = new List<Opportunity>();
        List<Customer_Project__c> cpList2 = new List<Customer_Project__c>();
        
        for(Integer i=0;i<90;i++) {
            Opportunity o = new Opportunity();
            o.Name = 'Antra'+i;
            o.CloseDate = Date.newInstance(2022, 02, 22);
            o.StageName = 'Prospecting';
            o.Active_Customer_Project__c = false;
            oList.add(o);
        }
        
        insert oList;
        List<Opportunity> opList = [SELECT Name, CloseDate, StageName, Active_Customer_Project__c from Opportunity 
                                        WHERE StageName = 'Prospecting' AND Active_Customer_Project__c = false];
        for(Opportunity o : opList) {
            Customer_Project__c cp = new Customer_Project__c();
            cp.Status__c = 'Active';
            cp.Name = cp.Name;            
            cp.Opportunity__c = o.Id;
            cpList2.add(cp);
        }
        insert cpList2;
        
        Test.stopTest();
        List<Opportunity> opList3 = [SELECT Id,Active_Customer_Project__c from Opportunity WHERE 
                                     StageName = 'Prospecting'];
        for(Opportunity op : opList3) {
            System.assert(op.Active_Customer_Project__c == true, 'Test Failed');
        }
        
    }
    
}