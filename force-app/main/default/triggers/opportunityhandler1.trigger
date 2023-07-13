trigger opportunityhandler1 on Opportunity (after insert,after update) {
if(trigger.isAfter &&(Trigger.Isinsert|| trigger.isUpdate)){
     OpportunityHandler.UpdateConDescriFild(trigger.new);
     }
}