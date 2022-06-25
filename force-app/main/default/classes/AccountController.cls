public with sharing class AccountController {
    /*
    * Author:- Venkata Murali Krishna
    * Description:- This apex class is server side controller for LWC component (callApexClassWithWireProperty)
    * Created:- 25-June-2022
    * Last Updated:- 25-June-2022
    */
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        List<Account> accList = [SELECT Id,Name from Account WITH SECURITY_ENFORCED];
        return accList;
    }
}
