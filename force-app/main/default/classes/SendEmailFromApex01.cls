public with sharing class SendEmailFromApex01 {
    public static void sendEmailMethod(){
        Messaging.SingleEmailMessage ms = new Messaging.SingleEmailMessage();
        EmailTemplate et = [SELECT Id from EmailTemplate WHERE Name ='Second Email Template Using Letterhead' WITH SECURITY_ENFORCED];
        ms.setTemplateId(et.Id);
        Contact con = [SELECT Id,Name from Contact WHERE Name='murali' WITH SECURITY_ENFORCED];
        ms.setTargetObjectId(con.Id);
        Account acc = [SELECT Id,Name from Account WHERE Name='Linkedin' WITH SECURITY_ENFORCED];
        ms.setWhatId(acc.Id);
        List<Messaging.Email> me = new List<Messaging.Email>{ms};
        Messaging.sendEmail(me);
    }
}
