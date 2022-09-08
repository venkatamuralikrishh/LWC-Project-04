public with sharing class conTrigToUpdateNumberHandler {
    
    public static void updateParentAccount(Map<Id, Contact> newConMap){
        
        Set<Id> accIds = new Set<Id>();
        for(Contact c : newConMap.values()){
            if(c.Phone != null){
                accIds.add(c.AccountId);
            }
        }

        List<Account> accList = [SELECT Id, Name, Phone from Account WHERE ID IN : accIds];
        System.debug(accList);
        
        for(Account acc : accList){
            for(Contact con : newConMap.values()){
                if(con.AccountId == acc.Id){
                    acc.Phone = con.Phone;
                }
            }
            System.debug(acc.Phone);
        }
        update accList;
    }
}