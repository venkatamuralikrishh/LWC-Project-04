public class duplicateAvoidCodeHandler {
    Public static void  m1(List<Account> accList){
        List<Account> l2 =[SELECT Phone from Account];
        For(Account a : accList){
            For(Account s : l2){
                If(a.phone==s.phone){
                    a.addError('already phone number is exists in database');
                }
            }
        }        
    }
}