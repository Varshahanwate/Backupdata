trigger onlyoneaccountopportunitycreate on Opportunity (before insert,before update) {
    if(Trigger.isBefore ){
        if(Trigger.isInsert){
        onlyoneopportunityperday.createopponAccount(Trigger.new);
    }
    }
}