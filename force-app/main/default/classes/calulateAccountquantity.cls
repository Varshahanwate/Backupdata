public class calulateAccountquantity {
    public static void AccountproductChange(List<Contact> conList, Map<Id, Contact>conMap){  
        Set<Id> setId = new Set<Id>();
        for(Contact con : conList){
            if((conMap== Null && con.AccountId != Null && con.Order_Quantity__c != Null) ||
               (conMap != Null && con.AccountId != Null && con.Order_Quantity__c != conMap.get(con.Id).Order_Quantity__c)){
                   // if(opp.AccountId != Null && opp.Amount!=Null){
                   setId.add(con.AccountId);
               }
        }
        List<Account> aList = [SELECT Id, Product_quantity__c, (SELECT Id, Order_Quantity__c FROM Contacts) FROM Account WHERE Id IN: setId];
        if(!aList.isEmpty()){
            for(Account acc : aList){
                Decimal total = 0;
                for(Contact co : acc.Contacts){
                    if(co.Order_Quantity__c!=null){
                        total = total + co.Order_Quantity__c;
                    }
                }
                acc.Product_quantity__c= total;
            }
        }
        if(!aList.isEmpty()){
            Update aList;
        }
    }
    }