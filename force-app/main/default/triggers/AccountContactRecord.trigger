trigger AccountContactRecord on Account (before insert, before update, after insert,after update) {
    if(Trigger.isInsert && Trigger.isBefore){
        AccountContactRecordHandler acr = new AccountContactRecordHandler();
        acr.updateSalesRep(Trigger.new);
    }
    if(Trigger.isInsert && Trigger.isAfter){
        AccountContactRecordHandler acr = new AccountContactRecordHandler();
        acr.CreateContact(Trigger.new);
        acr.createContacts(Trigger.new);
    }
}