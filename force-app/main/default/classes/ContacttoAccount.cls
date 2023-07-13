/* Description:- This code is used for whenever contact is create then at the time same time account also create
 * and Account Id populated to the Contact Account Name.
 * */
public class ContacttoAccount {
    public static void Accountcreate(List<Contact> conList){
     List<Account> createNewAcc = new List<Account>();
            Map<String,Contact> conNameKeys = new Map<String,Contact>();//
            for (Contact con : conList){  
                String accountName = con.firstname + ' ' + con.lastname;  
                conNameKeys.put(accountName,con);                      
                Account accObj = new Account();  
                accObj.Name = accountName;
                accObj.Phone= con.MobilePhone;
                accObj.Description =con.Department;
                createNewAcc.add(accObj);  //createNewAcc  me all value of accobj add kr rye hai
            } 
        if(createNewAcc.size()> 0){
          Insert createNewAcc;
        }
        //This block of code is used to populate account name 
        for(Account Ac :createNewAcc){ // iterate createNewAcc one by one in for loop
            if(conNameKeys.Containskey(Ac.Name)){
              conNameKeys.get(Ac.Name).AccountId=Ac.Id;  
            }
        }
}
    //Roll up summery apex class
    public static void countContact(List<Contact>conlist){
        List<Account>accListtobeUpdate = new List<Account>();
        set<Id>setid = new Set<Id>();
     for(Contact con:conlist){
      setid.add(con.AccountId);
     }
    List<Account>cclist = [SELECT Id,CountContacts__c,(Select Id from Contacts) from Account where Id IN:setid];
//system.debug(accList);

if(cclist!=null)
{
for(Account AccObj : cclist)
{
AccObj.CountContacts__c = AccObj.Contacts.size();
}
}
if(cclist.size()>0)
{
update cclist;
}
}
}