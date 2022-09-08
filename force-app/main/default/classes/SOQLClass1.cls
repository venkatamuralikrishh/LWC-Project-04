public class SOQLClass1 {
    public static void main() {
        List<Account> accList1 = [Select Name, AccountNumber from Account];
        for (Account a : accList1)
        {
            system.debug('AccName = '+a.Name+ 'AccNumber = '+a.AccountNumber);
        }
    }

}