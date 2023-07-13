trigger TriggerForAccount1 on Contact (before insert,After insert,After update) {
     
       // if(trigger.isInsert && trigger.isBefore){
           ContactAccount.Accoppcreate(Trigger.New); // Account Create when Contact is Created
            //} 
    if(trigger.isInsert && trigger.isAfter){
            //RecentContactUpdate.contactinsert(Trigger.New);// Recent Contact Update
            ContactAccount.oppcreate(Trigger.New);
            calulateAccountquantity.AccountproductChange(Trigger.new,null);//Calculation of Account product
            }
    if(Trigger.isAfter && Trigger.isUpdate){
        //RecentContactUpdate.updateRecentContactOnAccount(Trigger.new,Trigger.oldMap);
        calulateAccountquantity.AccountproductChange(Trigger.new,trigger.oldmap);
    }
        }