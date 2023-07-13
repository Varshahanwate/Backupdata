@isTest
public class updateAccountTest {
    @isTest static void testOpportunitiesUpdated() {
        List<Opportunity>olist = new List<Opportunity>();
        // Create test data: Account and related Opportunities
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
        Opportunity openOpp = new Opportunity(
            Name = 'Open Opportunity',
            StageName = 'Prospecting',
            CloseDate = System.today() -1,
            AccountId = testAccount.Id
            //CreatedDate =System.today()
            );
            olist.add(openOpp);
        system.debug('check olist'+olist);
        system.debug('check olistsize1'+olist.size());
       
        if( olist.size()>0){
            for(Opportunity opp : [SELECT Id, Name, CloseDate, StageName, CreatedDate FROM Opportunity]) {
        if(opp.CreatedDate < Date.today().addDays(-30) || opp.StageName != 'Closed Won') {
            insert openOpp;
        olist.add(openOpp);
        Update openOpp;
            system.debug('check olist1'+olist);
            system.debug('check olistsize2'+olist.size());
        }
        
       Opportunity closedOpp = new Opportunity(
            Name = 'Closed Opportunity',
            StageName = 'Prospecting',
            CloseDate = System.today() -2,
            AccountId = testAccount.Id
            //CreatedDate =System.today()
        );
        olist.add(closedOpp);
        if( olist.size()>0){
        insert closedOpp;
        olist.add(closedOpp);
        update closedOpp;
        }
        // Call the method under test
        updateAccunt.mymethod(new List<Account>{testAccount});
        
        // Verify that openOpp was updated to Closed Lost and its CloseDate was set to today
        Opportunity updatedOpp = [SELECT Id, Name, StageName,AccountId,CreatedDate, CloseDate FROM Opportunity WHERE Id =:openOpp.Id];
        System.assertEquals('Prospecting', openOpp.StageName);
        System.assertEquals(System.today()-1, openOpp.CloseDate);
        
        // Verify that closedOpp was not updated
        Opportunity unchangedOpp = [SELECT Id, Name, StageName,AccountId, CreatedDate,CloseDate FROM Opportunity WHERE Id =:closedOpp.Id];
        System.assertEquals('Prospecting', closedOpp.StageName);
        System.assertNotEquals(system.today()-1, closedOpp.CloseDate);
    }
}
    }
}