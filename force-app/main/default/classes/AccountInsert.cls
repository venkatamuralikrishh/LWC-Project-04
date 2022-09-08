public class AccountInsert implements AccountInterface{

    public static void insertRecords(){
        List<Account> accList = new List<Account>();
        for(Integer i=0;i<10;i++){
            Account a = new Account();
            a.Name = 'king nagendra '+i;
            accList.add(a);
        }
        insert accList;
        System.debug('record inserted');
    }
}