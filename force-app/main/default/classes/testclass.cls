@isTest
public class testclass {
  @isTest
    public static void testduplicateId(){
         List<Contact> conlist = new List<COntact>();
        Contact con = new Contact();
            con.Start_Date__c = System.today();
            con.End_Date__c = system.today();
            con.Status_new__c ='New';
         
          conlist.add(con);
          insert conlist;
        Contact con1 = new Contact();
          con1.End_Date__c =  System.today() + 5;
          
          insert con1;
        system.debug('check'+con1);
        dateApexclass.Mymothod(conlist);
            
}
    }