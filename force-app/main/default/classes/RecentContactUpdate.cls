public class RecentContactUpdate {
    public  static void contactinsert(List <Contact>conlist){  //After insert
        Map<Id,String>map1 =new Map<Id,String>();  // Declaration
        
        
        for(Contact con :conlist){
            if(con.Phone!=Null){
               map1.put(con.AccountId,con.Phone); 
            }
        }
        List<Account>aclist=[Select Id ,Phone ,(select id ,Phone from Contacts)from Account WHERE Id IN:map1.keyset() ORDER BY CreatedDate DESC LIMIT 1 ];
        for(Account ac:aclist){
            if(map1.containskey(ac.Id)){
                ac.Phone=map1.get(ac.Id);
            }
        }
        if(aclist.size()>0){
            update aclist;
        }
        
    }
    Public static void updateRecentContactOnAccount(List<Contact> cList, map<Id, contact> oldmap)//After Update//
    {
        Map<Id, String> Map1 = new Map<Id, String>();//Declaration//
        
        For(contact co:clist)
        {   
            If(co.Phone != oldmap.get(co.Id).Phone && co.Phone !=Null) //oldmap.get(co.Id).Phone==> 1234 , co.phone = null
            {
                Map1.put(co.AccountId, Co.Phone);
            }
            
        }
        List<Account> acList =[SELECT Id, Phone From Account WHERE Id IN : Map1.Keyset()ORDER BY CreatedDate DESC LIMIT 1];
        For(Account ac:acList)
        {
            If(Map1.containskey(ac.Id))
            {
                ac.Phone = Map1.get(ac.Id);
            }
        }
        if(aclist.size()>0)
        {
            Update acList; 
        }
        
    }

}