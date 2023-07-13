public class Apexhandler {
  public static void duplicatePhoneMethod(List<Account> accList){
        
        List<String> csSet = new List<String>();
        
        list<Account> acList = [Select id, Phone From Account];
        
        for(Account acc : acList){
            
            csSet.add(acc.Phone);
        }
        
        for(Account ac: accList){
            if(csSet.contains(ac.Phone)) {
                ac.adderror('Duplicate Phone');
            }
        }
    }
    }