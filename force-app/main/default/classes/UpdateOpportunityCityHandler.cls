public class UpdateOpportunityCityHandler {
    public static void updateOpportunityCity(List<Account> newAccounts, Map<Id, Account> oldAccountMap) {
        Set<Id> accIdsToUpdate = new Set<Id>();
        
        for (Account acc : newAccounts) {
            Account oldAcc = oldAccountMap.get(acc.Id);
            if (acc.BillingCity != oldAcc.BillingCity) {
                accIdsToUpdate.add(acc.Id);
            }
        }
        
        List<Opportunity> oppsToUpdate = [SELECT Id, City__c,AccountId FROM Opportunity WHERE AccountId IN :accIdsToUpdate];
        for (Opportunity opp : oppsToUpdate) {
            Account acc = [SELECT Id, BillingCity FROM Account WHERE Id = :opp.AccountId LIMIT 1];
            opp.City__c = acc.BillingCity;
        }
        
        update oppsToUpdate;
    }
}