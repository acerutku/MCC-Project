public with sharing class ContactTriggerHandler {
    
    public static void updateAccountActiveContacts(List<Contact> contactList){
        Set<Id> accountIds = new Set<Id>();
        for(Contact con : contactList){
            if(String.isNotBlank(con.AccountId)){
                accountIds.add(con.AccountId);
            }
        }
        List<Account> accList = [SELECT Id, Active_Contacts__c, (SELECT Id FROM Contacts WHERE Active__c = true)
                                 FROM Account WHERE Id IN: accountIds];
        for(Account acc:accList){
            If(!acc.Contacts.isEmpty()){
                acc.Active_Contacts__c = acc.Contacts.size();
            }else{
                acc.Active_Contacts__c = 0;
            }
        }
        update accList;
    }
}