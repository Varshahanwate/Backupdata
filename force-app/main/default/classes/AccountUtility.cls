public class AccountUtility {
    public static void viewAnnualRevenue(){
        List<Account>accountsList=[select Id,Name,AnnualRevenue from Account];//concadination of Annualrevenue and Name
        for(Account acc:accountsList){
            String acctRev = acc.Name + ':'+ acc.AnnualRevenue ;
            system.debug('acctRev '+ acctRev);
        }
    }

}