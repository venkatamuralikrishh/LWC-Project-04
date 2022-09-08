public with sharing class EmployeeTriggerHandler {
    public static void updateRecord(Map<Id,Employee__c> newMap){

        //update the same record in the after insert event using SOQL
        Set<Id> newIds = newMap.keyset();
        List<Employee__c> empList = [SELECT Id, Name, Reisgned__c, Reason_for_resign__c from Employee__c WHERE ID IN : newIds];
        for(Employee__c e : empList){
            if(e.Reisgned__c == 'NO'){
                e.Reason_for_resign__c = 'I will resign';
            }
        }
        List<Database.SaveResult> results = Database.update(empList, false);
        for(Database.SaveResult sr : results){
            if(sr.isSuccess()){
                system.debug(sr.getId());
            }
            else{
                for(Database.Error er : sr.getErrors()){
                    system.debug('erros=========>');
                    System.debug('get fields====>' + er.getFields());
                    System.debug('get message=====>' + er.getMessage());
                }
            }
        }
    }
}