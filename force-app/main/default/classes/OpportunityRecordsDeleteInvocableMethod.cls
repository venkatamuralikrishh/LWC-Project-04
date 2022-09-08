public class OpportunityRecordsDeleteInvocableMethod {
	@InvocableMethod
    public static void deleteTheRecord(List<Id> s) {
        Opportunity op =[SELECT Id,Name from Opportunity WHERE ID in : s];
        delete op;
    }
}