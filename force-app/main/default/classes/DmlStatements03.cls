public class DmlStatements03 {
    public static void callMe(){
        List<Account> accList = new List<Account>();
        
        Account a1 = new Account();
        a1.Name = 'Database.insert';
        accList.add(a1);
        
        Account a2 = new Account();
        a2.Rating = 'Hot';
        accList.add(a2);
        
        //use database.insert method
        List<Database.SaveResult> results = Database.insert(accList,false);
        for(Database.SaveResult sr : results){
            if(sr.isSuccess()){
                system.debug('record id ===>'+sr.getId());
            }
            else{
                for(Database.Error er : sr.getErrors()){
                    system.debug('errors ======>');
                    system.debug('fields===>'+er.getFields());
                    system.debug('message===>'+er.getMessage());
                }
            }
        }
        
    }
}