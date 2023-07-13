trigger Acounttrigger1 on Account (after update,after insert,before insert,before delete,after delete) {
    //updateAccunt.mymethod(Trigger.new);
    If(trigger.isbefore && trigger.isInsert){
        Rollupsummery.updateopprtunity(Trigger.new);      
    }
     If(trigger.isAfter && trigger.isUpdate){
        Rollupsummery.updateopprtunity(Trigger.new);
        }
    If(trigger.isAfter && trigger.isInsert){
        Rollupsummery.sendEmail(Trigger.new);
    }
    If(trigger.isbefore || trigger.isDelete){
   Rollupsummery.deletcontactwithsameacccountname(Trigger.new);
   }
}