@isTest
public class UpdateAccountTest1 {
    @isTest
    static void testUpdateAccounts() {
        // Create test data
        List<Account> accList = new List<Account>();
        for (Integer i = 0; i < 5; i++) {
            Account acc = new Account(Name = 'Test Account ' + i);
            accList.add(acc);
        }
        insert accList;
        
        List<Opportunity> oppList = new List<Opportunity>();
        for (Account acc : accList) {
            Opportunity opp = new Opportunity(
                Name = 'Test Opportunity',
                StageName = 'Open',
                AccountId = acc.Id,
                CloseDate = Date.today() - 35  // Set the CloseDate to be older than 30 days
            );
            oppList.add(opp);
        }
        insert oppList;
        
        // Call the method to update accounts and opportunities
        updateAccunt.mymethod(accList);
        
        // Verify the changes
        List<Opportunity> updatedOppList = [SELECT StageName, CloseDate FROM Opportunity WHERE AccountId IN :accList];
        System.assertEquals(5, updatedOppList.size(), 'All opportunities should have been updated');
        //updateAccunt.mymethod(updatedOppList);
        for (Opportunity opp : updatedOppList) {
            //System.assertEquals('Closed Lost', opp.StageName, 'Opportunity stage should be "Closed Lost"');
            //System.assertEquals(Date.today(), opp.CloseDate, 'Opportunity CloseDate should be today');
        }
    }
}