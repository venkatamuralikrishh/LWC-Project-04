public class AccountContactRecordHandler {
    
    public void CreateContact(List<Account> acc){
        for(Account a : acc){
            if(a.Type == 'Prospect'){
                Contact con = new Contact();
                con.lastName = a.Name;
                con.AccountId = a.Id;
                insert con;
            }
        }
    }
    public void updateSalesRep(List<Account> accList) {
        
        Set<Id> idList = new Set<Id>();
        for(Account a : accList) {
            idList.add(a.OwnerId);
        }
        List<User> uList = [SELECT Id,Name from User WHERE Id in : idList]; //retrieving list of records from user object
        Map<Id,User> uMap = new Map<Id,User>(uList); //converting list to map
        for(Account a : accList) {
            User u = uMap.get(a.OwnerId); //creating a user object from map
            a.Sales_Rep__c = u.Name; //assigning name to sales rep text field
        }
    }
    public void createContacts(List<Account> accList) {
        List<Contact> conList = new List<Contact>();
        Set<Id> idList = new Set<Id>();
        Double count;
        Integer i;
        for(Account a : accList) {
            if(a.NumberofLocations__c>0) {
                count = a.NumberofLocations__c;
                idList.add(a.Id);
            }
        }
        List<Account> accList2 = [SELECT Name,NumberofLocations__c from Account WHERE id in : idList];
        for(Account a : accList2) {
            for(i=0;i<count;i++) {
                contact con = new contact();
                con.lastName = a.Name;
                con.AccountId = a.Id;
                conList.add(con);
            }
        }
        insert conList;
    }
}