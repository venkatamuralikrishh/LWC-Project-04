public with sharing class CaseTriggerHandler {
    
    public static void updateNewCase(List<Case> caseList){
        for(Case c : caseList){
            if(c.Origin=='Email'){
                c.Status='new';
                c.Priority='Medium';
            }
        }
    }
}
