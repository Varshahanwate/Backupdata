trigger teacherTriggerhalper on Teacher__c (before insert,before update) {
    if(Trigger.isBefore && Trigger.IsInsert){
    Emailrequired.mymethod(Trigger.New);
        Emailrequired.GenderSalutation(Trigger.New);
        }

}