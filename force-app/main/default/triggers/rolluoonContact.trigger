trigger rolluoonContact on Contact (after insert ,after update,after delete,after undelete) {
    if(Trigger.isinsert||Trigger.isupdate||Trigger.isdelete||Trigger.isundelete){
        Rollupsummery.Countcontacts(trigger.new,trigger.old);
    }
}