public class AccountTriggerTaskCreationHandler {
    
    public static void createTask(List<Account> newAccList, Map<Id,Account> oldMapAcc){
        List<Task> taskToInsert = new List<Task>();
        for(Account accNew : newAccList){
            if(accNew.Industry != oldMapAcc.get(accNew.Id).Industry){
                Task t = new Task();
                t.Subject='new task from trigger';
                t.Status='Not Started';
                t.Priority='High';
                t.OwnerId=accNew.OwnerId;
                t.Description='Dheeraj is intelligent boy';
                taskToInsert.add(t);
            }
        }
        insert taskToInsert;
    }
}