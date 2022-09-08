//provider org
@RestResource(urlMapping='/AccountProvider')
global class AntraTestOrgConsumer {
    @HttpGet
    global static List<Account> setAccountData() {
        List<Account> accList = [SELECT Name,AccountNumber,Active__c,Count_of_Contacts__c from Account];
        return accList;
    }
    class Res_Account_Data {
        String nm;
        String accnumber;
    }
    
    @HttpPost
    global static ID postAccountData() {
        RestRequest rreq = RestContext.request;
        System.debug(rreq);
        String s1 = rreq.requestBody.toString();
        Res_Account_Data rad = (Res_Account_Data)json.deserialize(s1,Res_Account_Data.class);
        System.debug(rad);
        Account a = new Account();
        a.Name = rad.nm;
        a.AccountNumber = rad.accnumber;
        insert a;
        return a.Id;
    }
    @HttpPatch
    global static ID patchAccountData() {
        RestRequest rreq = RestContext.request;
        System.debug(rreq);
        String s1 = rreq.requestBody.toString();
        Res_Account_Data rad = (Res_Account_Data)json.deserialize(s1,Res_Account_Data.class);
        System.debug(rad);
        Account acc = [SELECT Name from Account WHERE Name =: rad.nm];
        acc.AccountNumber = rad.accnumber;
        update acc;
        return acc.Id;
    }
}