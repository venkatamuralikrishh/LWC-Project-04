trigger Top_X_DesignationExample on Top_X_Designation__c (before insert, before update, before delete, after insert, after update, after delete) {
    if(Trigger.isInsert && Trigger.isAfter) {
        Top_X_DesignationExampleHandler deh = new Top_X_DesignationExampleHandler();
        deh.updateOppty(Trigger.new);
    }
    if(Trigger.isUpdate && Trigger.isAfter) {
        Top_X_DesignationExampleHandler deh = new Top_X_DesignationExampleHandler();
        deh.updateOppty(Trigger.new);
    }
}