public class CountTeacher {
    public static void CountofTeachers(List<Teacher__c> newlist,List<Teacher__c>oldlist){
        set<Id>accid =new set<Id>();
        if(newlist!=null){
        for(Teacher__c c:newlist){
            if(c.PATIENT__c!=null){
                accid.add(c.PATIENT__c);
            }
            }
        }
        if(oldlist!=null){
        for(Teacher__c c:oldlist){
          accid.add(c.PATIENT__c);
           }
        }
        List<PATIENT__c>acc=[select id,CountTeacher__c,(select id from Teachers__r)from PATIENT__c Where id IN:accid];
        for(PATIENT__c accvalue:acc){
            accvalue.CountTeacher__c=accvalue.Teachers__r.size();
        }
        if(!acc.isempty()){
            update acc;
        }
    }

}