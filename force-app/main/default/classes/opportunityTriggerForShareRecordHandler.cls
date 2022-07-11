public with sharing class opportunityTriggerForShareRecordHandler {
    
    //whenever opportunity stage name is modified share the record with corresponding owner's manager.
    public static void shareRecord(Map<Id,Opportunity> newMap, Map<Id, Opportunity> oldMap){
        //get all the Owner Id's of opportunity records
        List<Opportunity> newOpp = newMap.values();
        Set<Id> userIds = new Set<Id>();
        for(Opportunity opp : newOpp){
            userIds.add(opp.OwnerId);
        }
        //query the user records with corresponding manager id 
        List<User> users = [SELECT Id,Manager.Name,Manager.Id from User WHERE ID IN : userIds];
        System.debug(users);
        //put the user id and manager id in a map
        Map<Id,Id> userManagerIds = new Map<Id,Id>();
        for(User u : users){
            userManagerIds.put(u.Id, u.Manager.Id);
        }
        //create the collection for OpportunityShare object and insert into the database
        List<OpportunityShare> osListToInsert = new List<OpportunityShare>();
        for(Opportunity op : newOpp){
            if(op.StageName != oldMap.get(op.Id).StageName){
                OpportunityShare os = new OpportunityShare();
                os.OpportunityId  = op.Id;
                Id manager = userManagerIds.get(op.OwnerId);
                os.UserOrGroupId = manager;
                os.OpportunityAccessLevel  = 'Read';
                os.RowCause = 'Manual';
                osListToInsert.add(os);
            }
        }
        List<Database.SaveResult> results = Database.insert(osListToInsert, false);
        for(Database.SaveResult sr : results){
            if(sr.isSuccess()){
                System.debug('records inserted===>'+sr.getId());
            }
            else{
                for(Database.Error er : sr.getErrors()){
                    system.debug('Errors ====>');
                    System.debug(er.getFields());
                    system.debug(er.getMessage());
                }
            }
        }
    }
}
