trigger updatecityonAccounttooppr on Account (after insert,after update) {
    UpdateOpportunityCityHandler.updateOpportunityCity(Trigger.new,trigger.oldmap);
    

}