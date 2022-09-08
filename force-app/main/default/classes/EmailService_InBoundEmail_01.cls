public with sharing class EmailService_InBoundEmail_01 implements Messaging.InboundEmailHandler{
    
    public static Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email,Messaging.InboundEnvelope env){
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        String fromAdd = email.fromAddress;
        String body = email.plainTextBody;
        String subject = email.subject;
        Contact con = [SELECT Id, Name from Contact WHERE Email =: fromAdd ORDER BY CreatedDate Desc LIMIT 1];
        Case c = new Case();
        c.Subject = subject;
        c.Priority = 'High';
        c.Status = 'New';
        c.Origin = 'Email';
        c.Description = body;
        c.ContactId = con.Id;
        insert c;
        result.success = true;
        return result;
    }
}