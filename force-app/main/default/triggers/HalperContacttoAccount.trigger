trigger HalperContacttoAccount on Contact (before insert) {
    if(trigger.isInsert && trigger.isbefore){
        ContacttoAccount.Accountcreate(Trigger.New);
    }

}