public with sharing class LeadController {
    @AuraEnabled(cacheable=true)
    public static List<Lead> getLeads(String searchKey, String addressFieldApiName) {
        String searchKeyLike = '%' + searchKey + '%';
        return [SELECT Id, Address_New__c FROM Lead WHERE Address_New__c	LIKE :searchKeyLike];
    }
}