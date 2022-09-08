@isTest
private class AccountTriggerTaskCreationHandlerTest {

    @isTest(seeAllData=true)
    //Use (seeAllData=true) to get data from database
    private static void checkMe(){
        List<Account> accNew = new List<Account>();
        Map<Id,Account> accOldMap = new Map<Id,Account>([SELECT Id,Industry,OwnerId from Account WHERE Industry='Agriculture']);
        for(Account a : accOldMap.values()){
            a.Industry='Banking';
            accNew.add(a);
        }
        update accNew;
        AccountTriggerTaskCreationHandler.createTask(accNew,accOldMap);
        List<Task> taskList = [SELECT Subject,Status,Priority,Description,OwnerId,Account.OwnerId from Task WHERE Subject = 'new task from trigger'];
        for(Task t : taskList){
            System.assertEquals('new task from trigger', t.Subject, 'subject failed');
            System.assertEquals('Not Started', t.Status, 'status failed');
            System.assertEquals('High', t.Priority, 'Priority failed');
            System.assertEquals('Dheeraj is intelligent boy', t.Description, 'Description failed');
            System.assertEquals(t.Account.OwnerId, t.OwnerId, 'OwnerId failed');
        }        
    }
}