public with sharing class getSAdetails {

    @AuraEnabled(cacheable=true)
    public static List<SA_detail__c> getSAdetail(String searchTerm) {
        searchTerm = searchTerm.trim();
        if (searchTerm == '') {
            return getSAdetail();
        }  
        
        searchTerm = '%' + searchTerm + '%';
        
        return [
            SELECT
                Id,
                Name,
                Experience__c,
                Name__c,
                Customer_handled__c,
                Date_of_Joining__c,
                Location__Latitude__s,
                Location__Longitude__s,
                Specilization__c
            FROM SA_detail__c
            WHERE Name__c LIKE :searchTerm
            WITH SECURITY_ENFORCED
            ORDER BY Name__c
            LIMIT 50
        ];
    }
}