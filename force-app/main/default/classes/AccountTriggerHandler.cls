public class AccountTriggerHandler {
    //Throw an error if user trying to create an account whose name already exists in the database
    public void duplicateAccount(List<Account> accList) {
        List<Account> accListInDatabase = [SELECT Name from Account];
        for(Account a : accList) {
            for(Account ald : accListInDatabase) {
                if(a.Name == ald.Name) {
                    a.Name.addError('Sorry, Name Already Exists Use another Name');
                }
            }
        }
    }
    //use custom setting to dynamically operate the trigger in production environment
    public void updateHelloField(List<Account> accList) {
        AccountTrigger__c l = AccountTrigger__c.getvalues('account');
        
        for(Account a : accList) {
            if(l.Activate__c==true) {
                if(a.Hello__c == null) {
                    a.Hello__c = 'World';
                }
            }
        }
    }
    //whenever user trying to update the account email field, update the associated contact email field
    public static void updateContactEmailField(List<Account> accList){
        set<Id> idSet = new set<Id>();
        for(Account a : accList){
            idSet.add(a.Id);
        }
        List<Contact> conList =[SELECT Id, Email,AccountId from Contact WHERE AccountId IN : idSet];
        for(Account a : accList){
            for(Contact c: conList){
                if(c.AccountId==a.Id){
                    c.Email=a.Email__c;
                }
            }
        }
        update conList;
    }
    //update the account website, if rating is equal to HOT
    public static void updateWebsiteField(List<Account> accList){
        for(Account a : accList){
            if(a.Rating=='Hot'){
                a.Website='WWW.GOOGLE.COM';
            }
        }
    }
    //throw an error if the user trying to create the account record with annual revenue less than 1000
    public static void checkRevenue(List<Account> accList){
        for(Account a : accList){
            if(a.AnnualRevenue==null || a.AnnualRevenue<1000){
                a.AnnualRevenue.addError('it should be greater than 1000');
            }
        }
    }
    //whenever user trying to create account record, create one contact record with same name and associate it with account record
    public static void createContact(List<Account> accList){
        List<Contact> conList = new List<Contact>();
        for(Account a : accList){
            Contact c = new Contact();
            c.AccountId=a.Id;
            c.LastName=a.Name;
            c.Email=a.Email__c;
            conList.add(c);
        }
        insert conList;
    }
    //whenever user trying to update the account name, throw an error that you cannot change the name
    public static void checkName(List<Account> accListNew,List<Account> accListOld){
        for(Account aNew : accListNew){
            for(Account aOld : accListOld){
                if(aNew.Name!=aOld.Name){
                    aNew.Name.addError('you cant change the name of the account');
                }
            }
        }
    }
    //whenever user trying to update the account billing address, update associated contact's mailing address
    public static void updateContactMailAddress(List<Account> accListNew,Map<Id,Account> accMapOld){
        Set<Id> accIdList = new Set<Id>();
        //loop the new account record values with old record values and check if billing address is changed or not
        //if billing address changed, add old record id's in a separeate set
        for(Account accNew : accListNew){
            Account accOld = accMapOld.get(accNew.Id);
            if(accNew.BillingStreet!=accOld.BillingStreet){
                accIdList.add(accOld.Id);
            }
        }
        //query the account records with all its associated contact records
        List<Account> accOldList = [SELECT Name,billingStreet,billingCity,billingCountry,(SELECT Name from Contacts) from Account WHERE ID IN: accIdList];
        List<Contact> conListToUpdate = new List<Contact>();
        for(Account a : accOldList){
            //getting child contacts for every account and store it in conList
            List<Contact> conList = a.Contacts;
            //loop through all contacts and update the mailing address
            for(Contact con : conList){
                con.mailingStreet = a.BillingStreet;
                con.mailingCity = a.BillingCity;
                con.mailingCountry = a.BillingCountry;
                //add every contact into a separete list collection to avoid DML statement inside for loop
                conListToUpdate.add(con);
            }
        }
        //check the size of collection and update the child contacts into database
        if(conListToUpdate.size()>0){
            update conListToUpdate;
        }
    }
    //throw an error if user is trying to delete an active account
    public static void checkAccountIsActive(List<Account> accListOld){
        for(Account a : accListOld){
            if(a.AccountActive__c==true){
                a.AccountActive__c.addError('you cant delete the active account');
            }
        }
    }
    //whenever user deletes an account, send confirmation email to the user (record is successfully deleted)
    public static void sendEmailToUser(List<Account> accListOld){
        List<String> emailList = new List<String>();
        String em = Userinfo.getUserEmail();
        emailList.add(em);
        List<Messaging.SingleEmailMessage> lms = new List<Messaging.SingleEmailMessage>();
        for(Account a : accListOld){
            Messaging.SingleEmailMessage ms = new Messaging.SingleEmailMessage();
            ms.setToAddresses(emailList);
            ms.setSubject('hi');
            ms.setPlainTextBody('record is deleted successfully'+a.Name);
            lms.add(ms);  
        }
        Messaging.sendEmail(lms);
    }
    //whenever user un-deletes an account, send confirmation email to the user (record is successfully un-deleted)
    public static void sendEmailToUserAfterUndelete(List<Account> accListnew){
        List<String> emailList = new List<String>();
        String em = Userinfo.getUserEmail();
        emailList.add(em);
        List<Messaging.SingleEmailMessage> lms = new List<Messaging.SingleEmailMessage>();
        for(Account a : accListnew){
            Messaging.SingleEmailMessage ms = new Messaging.SingleEmailMessage();
            ms.setToAddresses(emailList);
            ms.setSubject('hi');
            ms.setPlainTextBody('record is deleted successfully'+a.Name);
            lms.add(ms);  
        }
        Messaging.sendEmail(lms);
    }
}