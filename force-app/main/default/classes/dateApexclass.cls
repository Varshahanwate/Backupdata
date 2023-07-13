public class dateApexclass {
    public static void Mymothod(list<Contact>listcon){
        List<Contact>colist =New List<Contact>();
        for(Contact t: listcon) {
        if(t.Start_Date__c != Null){
    	t.Status_new__c = 'New';
}
            if(t.End_Date__c == system.today()){
                t.Status_new__c ='Expire';
            }
            if(t.End_Date__c > system.today()){
                t.Status_new__c = 'Renewal';
            }
}
    }
}