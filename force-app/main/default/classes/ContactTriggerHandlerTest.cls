@isTest
public class ContactTriggerHandlerTest {

    @isTest
    static void testUpdateAccountActiveContacts() {
        // Create test Accounts
        Account testAccount1 = new Account(Name='Test Account 1');
        insert testAccount1;
        Account testAccount2 = new Account(Name='Test Account 2');
        insert testAccount2;

        // Create test Contacts
        Contact testContact1 = new Contact(LastName='Test Contact 1', AccountId=testAccount1.Id, Active__c=true);
        insert testContact1;
        Contact testContact2 = new Contact(LastName='Test Contact 2', AccountId=testAccount1.Id, Active__c=true);
        insert testContact2;
        Contact testContact3 = new Contact(LastName='Test Contact 3', AccountId=testAccount2.Id, Active__c=false);
        insert testContact3;

        // Call method to update Accounts
        List<Contact> testContactList = new List<Contact>{testContact1, testContact2, testContact3};
        ContactTriggerHandler.updateAccountActiveContacts(testContactList);

        // Verify that the Active_Contacts__c field on the related Accounts is updated correctly
        testAccount1 = [SELECT Id, Active_Contacts__c FROM Account WHERE Id = :testAccount1.Id];
        testAccount2 = [SELECT Id, Active_Contacts__c FROM Account WHERE Id = :testAccount2.Id];
        System.assertEquals(2, testAccount1.Active_Contacts__c);
        System.assertEquals(0, testAccount2.Active_Contacts__c);
    }
}
