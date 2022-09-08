global class AccountScheduleClass implements Schedulable {
    global void execute(SchedulableContext sc) {
        AccountBatchClass abc = new AccountBatchClass();
        Database.executeBatch(abc);
    }
}