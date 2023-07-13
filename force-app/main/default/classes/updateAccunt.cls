public class updateAccunt {
    public static void mymethod(List<Account>accList){
        Set<Id> accountIds = new Set<Id>();
        for(Account acc:accList){
         DateTime day30=system.now()-30;
List<Opportunity> oppListToUpdate=new List<Opportunity>();
//getting the opportunities whose account has been updated
List<Opportunity> oppList = [Select Id, AccountId, StageName, CreatedDate, CloseDate from Opportunity where AccountId in :accountIds];
if(oppList.size()>0){
for(Opportunity opp : oppList){
//checking for condition if created date is greater than 30 days from today and stage not equal to close won
if(opp.CreatedDate<day30 || opp.StageName!='Closed Won'){
opp.StageName='Closed Lost';    //This is a mandatory field when we update the CloseDate
opp.CloseDate=system.today();
oppListToUpdate.add(opp);  //putting the changed opportunity to separate list to update later
}
}
}
//checking if the opportunity list which has changed is having records or not
if(oppListToUpdate.size()>0){
update oppListToUpdate;
}
}
    }
        
    }