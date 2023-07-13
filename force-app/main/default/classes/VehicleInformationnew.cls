public with sharing class VehicleInformationnew {
    @AuraEnabled(cacheable=true)
  public static List <Car__c> getVehicles(){
    List<Car__c> veh=[select id,Name,Picture_URL__c,Price__c from Car__c];
     return veh;
    }
  @AuraEnabled(cacheable=true)    
  public static List<Car__c> getVehiclelist(String s) {
      list<Car__c> listva = [SELECT Id, Name, Fuel_Type__c,Model_Number__c, Picture_URL__c, Price__c,Vehicle_Type__c FROM Car__c ]; 
    if(listva.size()>0){            
      return listva;         
    } 
   else { list<Car__c> listvaall = [SELECT Id, Name,Fuel_Type__c,Model_Number__c,Vehicle_Type__c,Picture_URL__c,Price__c FROM Car__c];        
   return listvaall;
  }
 }
}