public class AccountCount {
    @AuraEnabled(cacheable=true) 
    public static Integer getCount() {
        return [select count() from Account];
    }
  }