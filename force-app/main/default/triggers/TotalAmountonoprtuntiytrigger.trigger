trigger TotalAmountonoprtuntiytrigger on Opportunity (before insert, before update, after delete, after undelete)  {
   if(Trigger.isInsert || Trigger.isBefore){
        Rollupsummery.updateTotalopportunity(trigger.new,trigger.old);
        
    }
     if(Trigger.isupdate ||Trigger.isbefore){
       Rollupsummery.updateTotalopportunity(trigger.new,trigger.old);
        
    }
   if(Trigger.isundelete ||Trigger.isAfter){
       Rollupsummery.updateTotalopportunity(trigger.new,trigger.old);    
     }
    if(Trigger.isdelete ||Trigger.isbefore){
       Rollupsummery.updateTotalopportunity(trigger.new,trigger.old);
}
}