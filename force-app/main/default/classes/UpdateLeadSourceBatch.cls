public class UpdateLeadSourceBatch implements Database.Batchable<sObject>, Schedulable  {

    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead WHERE LeadSource = NULL');
    }

    public void execute(Database.BatchableContext BC, List<Lead> leads) {
        for (Lead l : leads) {
            l.LeadSource = 'Manual';
        }
        update leads;
    }

    public void finish(Database.BatchableContext BC) {
    }

    public void execute(SchedulableContext SC) {
        Database.executeBatch(this, 2000);
    }
    //String cronExpression = '0 0 23 * * ?';
   // UpdateLeadSourceBatch batch = new UpdateLeadSourceBatch();
   // System.schedule('UpdateLeadSourceBatch', cronExpression, batch);
}