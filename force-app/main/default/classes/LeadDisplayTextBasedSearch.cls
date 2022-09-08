public class LeadDisplayTextBasedSearch {
    @AuraEnabled
    public static List<Lead> getLeadData(String leadname) {
        String ln = leadname+'%';
        List<Lead> llist = [SELECT Name from Lead WHERE Name=:ln];
        return llist;
    }
}