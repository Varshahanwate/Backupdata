public class Emailrequired {
    public static void mymethod(List<Teacher__c>tList){
        
             for(Teacher__c t :tList){
                 if(t.Email__c==''||t.Email__c==null){
                     t.adderror('Enter Email Adress');
                 }
             }
        
    }
    public static void GenderSalutation(List<Teacher__c>teList){
        for(Teacher__c te :teList){
            if(te.Gender__c=='Female'){
                te.Name =' Ms.'+ te.Name;
            }
            else if(te.Gender__c=='Male'){
                te.Name =' Mr.'+ te.Name;
            }
        }
        
    }
}