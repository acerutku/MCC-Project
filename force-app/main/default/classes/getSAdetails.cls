public with sharing class getSAdetails {
    @AuraEnabled(Cacheable=true)
    public static List<SA_Detail__c> getSAdetails() {
            List<SA_Detail__c> saList = new List<SA_Detail__c>();
            saList = [SELECT Name, Id, Name__c, Customer_Handled__c, Date_of_Joining__c, Experience__c FROM SA_Detail__c];  
            System.debug('saList' +saList);    
            return saList;

    }
}