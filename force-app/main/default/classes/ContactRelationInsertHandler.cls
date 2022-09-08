public class ContactRelationInsertHandler {
    
    public void createRecord(List<Contact> conList) {
        List<Contact_Relationship__c> crList = new List<Contact_Relationship__c>();
        for(Contact c : conList) {
            if(c.Contact_Relationship__c == true) {
                Contact_Relationship__c cr = new Contact_Relationship__c();
                cr.Name = c.lastName;
                cr.Contact__c = c.Id;
                crList.add(cr);
            }
        }
        insert crList;
    }
    public void deleteRecord(List<Contact> conList) {
        List<Id> idList = new List<Id>();
        for(Contact c: conList) {
            idList.add(c.Id);
        }
        List<Contact_Relationship__c> cr1 = [SELECT Name,Contact__c from Contact_Relationship__c WHERE Contact__c in:idList];
        delete cr1;
    }
    public void unDeleteRecord(List<Contact> conList) {
        List<Id> idList = new List<Id>();
        for(Contact c :conList) {
            idList.add(c.Id);
        }
        List<Contact_Relationship__c> cr1 = [SELECT Name,Contact__c from Contact_Relationship__c WHERE Contact__c in:idList AND IsDeleted = true ALL ROWS];
        undelete cr1;
    }
    public void populateCountOnAccountAfterContactInsert(List<Contact> conList) {
        
        Set<Id> idList = new Set<Id>();
        for(Contact c: conList) {
            if(c.AccountId != null) {
                idList.add(c.AccountId);
            }
        }
        List<Account> accList = [SELECT Id,Name,Count_of_Contacts__c from Account WHERE id in: idList];
        Integer count = [SELECT count() from Contact WHERE AccountId in : idList];
        for(Account a : accList) {
            a.Count_of_Contacts__c = count;
        }
        update accList;
    }
    public void sendEmailToManager(List<Contact> conList) {
        if(conList!=null) {
            List<String> toemails = new List<String>();
            List<User> urList =[SELECT Name, UserRole.Name, Email from User WHERE UserRole.Name='SVP, Sales & Marketing'];
            for(User u:urList) {
                toemails.add(u.Email);
                /*toemails.add('bhargavasunilmallavolu@gmail.com');
toemails.add('nagendrababu0414@gmail.com');
toemails.add('monksai9@gmail.com');*/
            }
            List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
            //create email
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            EmailTemplate et=[SELECT Id,Body,Subject from EmailTemplate WHERE Name='trigger test classic template'];
            mail.setTemplateId(et.Id);
            mail.setHtmlBody(et.Body);
            mail.setToAddresses(toemails);
            mail.setSubject(et.Subject);
            //mail.setPlainTextBody('Hi, Assign a task to Sales rep to communicate with customer');            
            mailList.add(mail);
            //send emails
            Messaging.sendEmail(mailList);
        }
    }
        public void populateCountOnAccountAfterContactDelete(List<Contact> conList) {
            
            Set<Id> idList = new Set<Id>();
            for(Contact c: conList) {
                if(c.AccountId != null) {
                    idList.add(c.AccountId);
                }
            }
            List<Account> accList = [SELECT Id,Name,Count_of_Contacts__c from Account WHERE id in: idList];
            Integer count = [SELECT count() from Contact WHERE AccountId in : idList];
            for(Account a : accList) {
                a.Count_of_Contacts__c = count;
            }
            update accList;
        }
    }