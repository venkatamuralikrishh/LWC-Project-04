trigger opportunityOwnerAsOppTeamMember on Opportunity (before insert,before update,before delete, after insert, after update, after delete, after undelete) {

    //Whenever opportunity owner is modified create old owner as opportunity team member
    if(trigger.isAfter && trigger.isUpdate){
        opportunityOwnerAsOppTeamMemberHandler.addTeamMember(trigger.newMap, trigger.oldMap);
    }
}