public class ContactAccount {
    public static void Accoppcreate(List<Contact> conList){
        /*List<Contact> listOfContact = new List<Contact>();
        for (Contact conObj : conList){  
            if (String.isBlank(conObj.accountid)){  
                listOfContact.add(conObj);  
            }  
        }  
        
        if (listOfContact.size() > 0){  */
            List<Account> createNewAcc = new List<Account>();
            Map<String,Contact> conNameKeys = new Map<String,Contact>();
            
        for (Contact con : conList)   
            {  
                String accountName = con.firstname + ' ' + con.lastname;  
                conNameKeys.put(accountName,con);                      
                Account accObj = new Account();  
                accObj.Name = accountName;
                accObj.Phone= con.MobilePhone;
                createNewAcc.add(accObj);  
            } 
        if(createNewAcc.size()> 0){
          Insert createNewAcc;
        }
        for(Account Ac :createNewAcc){
            if(conNameKeys.Containskey(Ac.Name)){
              conNameKeys.get(Ac.Name).AccountId=Ac.Id;  
            }
        }
        }
    public static void oppcreate(List<Contact> conList){
        List<Opportunity>oppList = new  List<Opportunity>();
        Set<Id> setId =new Set<Id>();
        for(Contact c :conList){
            if(c.AccountId!= Null ){
                setId.add(c.AccountId);
            }
        }
        For(Account A: [select id ,Name from Account where Id=:setId]){
            Opportunity opp = New Opportunity();
            opp.Name = A.Name;
            opp.StageName = 'Prospecting';
            opp.CloseDate =system.today();
            opp.AccountId = A.Id;
            oppList.add(opp);
        }
        Insert oppList;
    }
    }