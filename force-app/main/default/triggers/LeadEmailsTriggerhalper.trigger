trigger LeadEmailsTriggerhalper on Lead (before insert) {
    if(Trigger.isBefore || trigger.isInsert){
        LeadDUplicateEmail.DuplicateEmailnotallow(Trigger.New);
        LeadDUplicateEmail.DuplicateEmailnotallowinlead(Trigger.new);
    }
}