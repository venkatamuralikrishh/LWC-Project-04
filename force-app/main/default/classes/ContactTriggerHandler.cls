public class ContactTriggerHandler {
    public static Boolean isTrigger = true;
    //update the associated account description (append with old description) when contact description is changed
    public static void updateAccountDescription(List<Contact> conList){
        Set<Id> idSet = new Set<Id>();
        for(Contact c : conList){
            idSet.add(c.AccountId);
        }
        List<Account> accList = [SELECT Name,Description from Account WHERE ID IN : idSet];
        List<Account> accList2 = new List<Account>();
        for(Contact c : conList){
            for(Account a : accList){
                if(c.AccountId==a.Id){
                    a.Description = a.Description+', '+c.Description;
                    accList2.add(a);
                }
            }
        }
        update accList2;
    }
    public static void updateAccountDescriptionOnContactInsert(List<Contact> conList){
        Set<Id> idSet = new Set<Id>();
        for(Contact c : conList){
            idSet.add(c.AccountId);
        }
        List<Account> accList = [SELECT Name,Description from Account WHERE ID IN : idSet];
        List<Account> accList2 = new List<Account>();
        for(Contact c : conList){
            for(Account a : accList){
                if(c.AccountId==a.Id){
                    a.Description = a.Description+', '+c.Description;
                    accList2.add(a);
                }
            }
        }
        update accList2;
    }
    //update count of contacts in account when a new contact is inserted
    public static void updateCountOfContactsOnInsert(List<Contact> conList){
        Set<Id> idSet1 = new Set<Id>();
        for(Contact con : conList){
            idSet1.add(con.AccountId);
        }
        List<Account> accList = [SELECT Count_of_Contacts__c, (SELECT Id,Name from Contacts) from Account WHERE ID IN : idSet1];
        for(Account a : accList){
            a.Count_of_Contacts__c = a.Contacts.size();
        }
        update accList;
    }
    //update count of contacts in account when a contact is deleted
    public static void updateCountOfContactsOnDelete(List<Contact> conList){
        Set<Id> idSet1 = new Set<Id>();
        for(Contact con : conList){
            idSet1.add(con.AccountId);
        }
        List<Account> accList = [SELECT Count_of_Contacts__c, (SELECT Id,Name from Contacts) from Account WHERE ID IN : idSet1];
        for(Account a : accList){
            a.Count_of_Contacts__c = a.Contacts.size();
        }
        update accList;
    }
    //update count of contacts in account when a contact is undeleted from recycle bin
    public static void updateCountOfContactsOnUndelete(List<Contact> conList){
        Set<Id> idSet1 = new Set<Id>();
        for(Contact con : conList){
            idSet1.add(con.AccountId);
        }
        List<Account> accList = [SELECT Count_of_Contacts__c, (SELECT Id,Name from Contacts) from Account WHERE ID IN : idSet1];
        for(Account a : accList){
            a.Count_of_Contacts__c = a.Contacts.size();
        }
        update accList;
    }
    //update count of contacts in both accounts when a contact is re-parented to another account
    public static void updateCountOfContactsOnUpdate(List<Contact> newConList,Map<Id,Contact> oldConMap){
        Set<Id> idSet1 = new Set<Id>();
        for(Contact con : newConList){
            idSet1.add(con.AccountId); // adding new account Id's to Set after re-parenting
            Contact c = oldConMap.get(con.Id); // this contact contains old vaules (Account Id's before re-parenting)
            idSet1.add(c.AccountId); // adding old Account Id's to Set before re-parenting
        }
        List<Account> accList = [SELECT Count_of_Contacts__c, (SELECT Id,Name from Contacts) from Account WHERE ID IN : idSet1];
        for(Account a : accList){
            a.Count_of_Contacts__c = a.Contacts.size();
        }
        update accList;
    }
    //update the Total amount in Associated account when a new contact is created
    public static void updateAmountInAccountOnContactInsert(List<Contact> conList){
        Set<Id> idSet1 = new Set<Id>();
        for(Contact con : conList){
            idSet1.add(con.AccountId);
        }
        List<Account> accList = [SELECT Total_Amount__c, (SELECT Id,Name,Amount__c from Contacts) from Account WHERE ID IN : idSet1];
        for(Account a : accList){
            Decimal total = 0;
            for(Contact c : a.Contacts){
                total = total + c.Amount__c;
            }
            a.Total_Amount__c = total;
        }
    }
}