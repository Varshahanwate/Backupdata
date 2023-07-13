public class OpportunityHandler {
public static void UpdateConDescriFild(list<Opportunity>opplst){
        Set<Id>SetofIds = new set<Id>();
        For(Opportunity opp:opplst){
            if(opp.StageName=='Closed Won'){
                setofIds.add(opp.AccountId);
            }
                
            }
        Map<Id,Contact>UpdateDescription = New Map<Id,Contact>([Select id,lastname, Description From Contact Where AccountId In:Setofids]);
    system.debug('123'+ UpdateDescription);
            List<Contact>conlst = new list<Contact>();
            for(Opportunity op:opplst){
                
                for(Contact con :UpdateDescription.values()){
                if(con.Description ==null){
                    con.Description=op.Id;
                    conlst.add(con);
                }
                  else if(con.Description !=null){
                    con.Description =con.Description +','+op.Id;
                    conlst.add(con);
                }
                
                }
        }
    update conlst;
}
}