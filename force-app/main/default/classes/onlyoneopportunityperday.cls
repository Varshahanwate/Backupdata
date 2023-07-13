public class onlyoneopportunityperday {
    public static void createopponAccount(List<Opportunity>oplist){
         
        set<Id>setId = new Set <Id>();
        for(Opportunity op :oplist){
            if(op.AccountId != null){
                setId.add(op.AccountId);
            }
        }
     Map<Id,Account> mapAccount = new Map<Id,Account>( [select id,(select id from opportunities where CreatedDate = TODAY) from account where id IN :setId]);
        for(Opportunity opp: oplist){
            if( opp.AccountId != null && mapAccount.containsKey(opp.AccountId) ){
                Account acc = mapAccount.get(opp.AccountId);
                if(acc.opportunities.size() > 0 ){
                    opp.addError('you can not add more then once opportunity for this account');
                }
            }
        }
    }

}