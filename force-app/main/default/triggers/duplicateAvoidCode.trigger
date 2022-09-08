trigger duplicateAvoidCode on Account (before insert,before update) {
    
    If(trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
        duplicateAvoidCodeHandler.m1(trigger.new);
    }
}