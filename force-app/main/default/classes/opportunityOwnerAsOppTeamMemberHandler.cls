public with sharing class opportunityOwnerAsOppTeamMemberHandler {
    
    /*
    * Author:- Venkata Murali Krishna
    * Description:- opportunity team member
    * Created:- 11-July-2022
    * Last Updated:- 11-July-2022
    */
    //Whenever opportunity owner is modified create old owner as opportunity team member
    public static void addTeamMember(Map<Id,Opportunity> newMap, Map<Id,Opportunity> oldMap){

        List<Opportunity> newList = new List<Opportunity>();
        newList = newMap.values();
        List<OpportunityTeamMember> teams = new List<OpportunityTeamMember>();
        for(Opportunity op : newList){
            if(op.OwnerId != oldMap.get(op.Id).OwnerId){
                OpportunityTeamMember otm = new OpportunityTeamMember();
                otm.opportunityId = op.Id;
                otm.userId = op.OwnerId;
                otm.OpportunityAccessLevel = 'Read';
                otm.TeammemberRole='Account Manager';
                teams.add(otm);
            }
        }
        insert teams;
    }
}