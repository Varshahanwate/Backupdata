public class ContactTriggerHandler {
    public static void accAndOppCreatedWithContact(List<Contact> conList){
        
        List<Contact> listOfContact = new List<Contact>();            
        
        for (Contact conObj : conList){  
            if (String.isBlank(conObj.accountid)){  
                listOfContact.add(conObj);  
            }  
        }  
        
        if (listOfContact.size() > 0){  
            List<Account> createNewAcc = new List<Account>();
            Map<String,Contact> conNameKeys = new Map<String,Contact>();
            
            for (Contact con : listOfContact)   
            {  
                String accountName = con.firstname + ' ' + con.lastname;  
                conNameKeys.put(accountName,con);                      
                Account accObj = new Account();  
                accObj.Name = accountName;
                accObj.Phone= con.MobilePhone;
                createNewAcc.add(accObj);  
            }  
            Insert createNewAcc;  
            for (Account acc : createNewAcc)   
                {  
                    system.debug('mapContainsKey ' + conNameKeys.containsKey(acc.Name));
                    
                    if (conNameKeys.containsKey(acc.Name))   
                    {  
                        conNameKeys.get(acc.Name).accountId = acc.Id;  
                    }  
                }  
            } 
        } 
    }
/*List<Opportunity> oppList = new <Opportunity>();
        for(Account Acc: createNewAcc){
            Opportunity opp = new Opportunity();
            opp.Name ='Opp test';
            opp.StageName ='Prospecting';
            opp.CloseDate= System.today();
            opp.AccountId= Acc.Id;
            oppList.add(opp);*/