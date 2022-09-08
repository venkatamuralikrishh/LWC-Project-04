public class PotentialCustomerTriggerHandler {
    public static void sendEmailToManager(List<Potential_Customer__c> pcList) {
        List<User> urList;
        if(pcList!=null) {
            List<String> toemails = new List<String>();
            urList =[SELECT Name, FirstName, LastName, UserRole.Name, Email from User WHERE UserRole.Name='SVP, Sales & Marketing'];
            for(User u:urList) {
                toemails.add(u.Email);
            }
            
            //get the email template from database
            EmailTemplate et = [SELECT Name,Id,Body,Subject FROM EmailTemplate WHERE Name='Potential Customer Email alert'];
            List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
            //create email
            for(Potential_Customer__c pc : pcList) {
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setTemplateId(et.Id);
                mail.setToAddresses(toemails);
                mail.setSubject(et.Subject);
                mail.setPlainTextBody(et.Body);
                System.debug(et.Body);
                mail.setSaveAsActivity(false);
                mail.setTargetObjectId(UserInfo.getUserId());
                mail.setWhatId(pc.Id);
                mailList.add(mail);
            }
            //send emails
            Messaging.sendEmail(mailList);
        }
    }
}