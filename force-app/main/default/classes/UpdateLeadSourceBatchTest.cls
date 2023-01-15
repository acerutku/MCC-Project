@isTest
public class UpdateLeadSourceBatchTest {
@isTest
        static void executeBatch(){
            Lead ld = new Lead(lastName='testLead', Company='testCompany', Status='Open - Not Contacted');
            insert ld;
            UpdateLeadSourceBatch mybatch = new UpdateLeadSourceBatch();
            Database.executeBatch(mybatch);
        }
}