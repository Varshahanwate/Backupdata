trigger LeadStatus1 on dfsle__RecipientStatus__c (before update) {

 set<id>sid=new set<id>();   
    for(dfsle__RecipientStatus__c d:trigger.new)
{
    sid.add(d.dfsle__SourceId__c);
}
map<id,lead>ll=new map<id,lead>([select id,status from lead where id in:sid]);
     
    for(dfsle__RecipientStatus__c d:trigger.new)
{
   lead l=ll.get(d.dfsle__SourceId__c);
    l.Status='Working - Contacted';
}
    try{
 update ll.values(); 
    }
    catch(exception e)
    {
       system.debug( e.getMessage());
    }
}