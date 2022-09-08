global class Soap_Example01 {
    webservice static String createAccountRecord(String nm, String em){
        Account acc = new Account();
        acc.Name = nm;
        acc.Email__c = em;
        insert acc;
        return acc.Id;
    }
}