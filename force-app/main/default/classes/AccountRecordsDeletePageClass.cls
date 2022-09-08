public class AccountRecordsDeletePageClass {
    public String accountlist{get;set;}
    public String employeeslist{get;set;}
    public List<SelectOption> getaccountpicklist() {
        
        List<SelectOption> accountpicklist = new List<SelectOption>();
        List<Account> acclist1 = [SELECT Name from Account];
        for(Account ac : acclist1) {
            accountpicklist.add(new SelectOption(ac.Name,ac.Name));
        }
        return accountpicklist;
    }
    
}