trigger Opportunitylineitemquantity on OpportunityLineItem (After insert) {
Rollupsummery.updateAccountPrctQty(Trigger.new);
}