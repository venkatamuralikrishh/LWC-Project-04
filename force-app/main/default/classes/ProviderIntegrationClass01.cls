@RestResource(urlMapping='/AccountData')
global class ProviderIntegrationClass01 {
	@HttpGet
    global static List<Account> accountData() {
        List<Account> accList = [SELECT Name, Phone from Account];
        return accList;
    }
    @HttpPost
    global static Account accountDataInsert(String nm, String ph) {
        Account a = new Account();
        a.Name=nm;
        a.Phone=ph;
        insert a;
        return a;
    }
    @HttpPut
    global static Account accountDataUpdate(String i,String nm, String ph) {
        Account acc = [SELECT Name, Phone from Account WHERE id=:i];
        acc.Name=nm;
        acc.Phone=ph;
        update acc;
        return acc;
    }
    /*@HttpPatch
    global static Account accountDataUpsert(List<Object> oList) {
        Set<String> ph = new Set<String>();
        for(Object o : oList) {
            if(o.ph!='') {
                ph.add(o.ph);
            }
        }
        List<Account> acc = [SELECT Name, Phone from Account WHERE Phone=:ph];
        
    }*/
}