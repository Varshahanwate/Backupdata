trigger AccountHandler on Account (before insert,before update) {
    if(Trigger.isbefore && trigger.isInsert){
        createAcount.myAccount(Trigger.new);
            }
     if (Trigger.isUpdate) {
            createAcount.myAccount(Trigger.new);
        }
        }
    
    /* list<Contact> lstCon = new list<Contact>();
    for(Account Acc: trigger.new){
        Contact con = new Contact ();
        Con.FirstName = 'test';
        Con.AccountId = Acc.Id;
        Con.LastName = Acc.Name;
        lstCon.Add(Con);
        
    }
insert lstCon; */