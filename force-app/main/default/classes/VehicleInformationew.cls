public with sharing class VehicleInformationew {
    @AuraEnabled(cacheable=true)
    public static List<Vehicle__c> getVehicle() {
        list<Vehicle__c> VList = [SELECT Id, Name,Fuel_Type__c,Model__c, Picture_URL__c, Vehicle_Price__c,Vehicle_Type__c 
                                  FROM Vehicle__c ];
        return VList;
    }
    @AuraEnabled(cacheable=true)    
  public static List<Vehicle__c> getVehiclelist() {
      list<Vehicle__c> listva = [SELECT Id, Name, Model__c, Picture_URL__c,Vehicle_Type__c, Vehicle_Price__c FROM Vehicle__c ]; 
    if(listva.size()>0){            
      return listva;         
    } 
   else { list<Vehicle__c > listvaall = [SELECT Id, Name,Model__c, Picture_URL__c, Vehicle_Price__c, Vehicle_Type__c FROM Vehicle__c ];        
   return listvaall;
  }
 }
}