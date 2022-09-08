trigger EmpTrigger on Emp__c (before insert, before update) {
    If(Trigger.isInsert && Trigger.isBefore){
        EmpTriggerHandler.EmpTriggermethod(Trigger.new);
        EmpTriggerHandler.salValidation(Trigger.new);
        
    }
    If(Trigger.isUpdate && Trigger.isBefore){
        EmpTriggerHandler.EmailValidation(Trigger.new, Trigger.old);
    }
    
}