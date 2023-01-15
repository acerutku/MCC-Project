@isTest
private class AccountTriggerTest {

    @isTest
    static void testAfterInsert() {
        Account acc = new Account(Name='Test Account');
        insert acc;

        // Query the database for the account that was just inserted
        Account insertedAccount = [SELECT Id FROM Account WHERE Id = :acc.Id];

        // Verify that the account was inserted
        System.assertEquals(acc.Id, insertedAccount.Id);

        // Verify that the trigger creates an opportunity
        List<Opportunity> opps = [SELECT Id FROM Opportunity WHERE AccountId = :acc.Id];
        System.assertEquals(1, opps.size());
    }

    @isTest
    static void testAfterUpdate() {
        Account acc = new Account(Name='Test Account');
        insert acc;

        // Update the account
        acc.Name = 'Updated Test Account';
        update acc;

        // Verify that the trigger updates the opportunity
        List<Opportunity> opps = [SELECT Id FROM Opportunity WHERE AccountId = :acc.Id];
        System.assertEquals(1, opps.size());
    }
}