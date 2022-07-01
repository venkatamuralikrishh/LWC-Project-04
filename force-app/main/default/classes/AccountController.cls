public with sharing class AccountController {
    /*
    * Author:- Venkata Murali Krishna
    * Description:- This apex class is server side controller for LWC component (callApexClassWithWireProperty)
    * Created:- 25-June-2022
    * Last Updated:- 26-June-2022
    */

    //CallApexClassWithWireProperty02 Lwc component
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsByName(String nm){
        List<Account> accList = [SELECT Id,Name from Account WHERE Name LIKE :nm+'%' WITH SECURITY_ENFORCED];
        system.debug(accList);
        return accList;
        
    }

    //CallApexClassWithWireProperty Lwc component
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        List<Account> accList = [SELECT Id,Name from Account WITH SECURITY_ENFORCED];
        return accList;
        
    }

    //callApexMethodImperatively Lwc Component
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(){
        List<Contact> conList = [SELECT Id,FirstName,LastName from Contact WITH SECURITY_ENFORCED];
        return conList;
        
    }
}
