public class EmpTriggerHandler {
    public static void EmpTriggermethod(List<Emp__c> emp){
        for(Emp__c e : emp) {
            Integer c = [SELECT Count() from Emp__c WHERE Dept__c=:e.Dept__c];
            If(c>=1) {
                e.Dept__c.addError('sorry, you cant insert the record');
            }
        }
    }
    //method for checking email value is already exists or not. If exists, throw
    //error message that "you cant change the email id".
    public static void EmailValidation(List<Emp__c> nemp, List<Emp__c> oemp){
        for(Emp__c ne: nemp){
            Boolean status = false;
            for(Emp__c oe: oemp){
                if(ne.Emp_Email__c != oe.Emp_Email__c && ne.Id == oe.Id){
                    status = true;
                    break;
                }
            }
            if(status==true){
                ne.Emp_Email__c.addError('You cant change email id');
            }
        }
    }
    public static void salValidation(List<Emp__c> emp) {
        for(Emp__c e : emp){
            switch on e.Dept_Name__c {
                when 'civil' {
                    if(!(e.Emp_salary__c>10000 && e.Emp_salary__c<20000)) {
                        e.Emp_salary__c.addError('salary must be b/w 10000 to 20000');
                    }
                }
                when 'mechanical' {
                    if(!(e.Emp_salary__c>15000 && e.Emp_salary__c<25000)) {
                        e.Emp_salary__c.addError('salary must be b/w 15000 to 25000');
                    }
                }
            } 
        }
        
    }
}