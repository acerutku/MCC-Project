@isTest
public class UpdateLeadSourceBatchTest {
@isTest
        static void executeBatch(){
            Lead ld = new Lead(lastName='testLead', Company='testCompany', Status='Manual');
            insert ld;
            UpdateLeadSourceBatch mybatch = new UpdateLeadSourceBatch();
            Database.executeBatch(mybatch);
        }
    @isTest
        static  void scheduableBatch() {        
         test.starttest();
         UpdateLeadSourceBatch myClass = new UpdateLeadSourceBatch ();   
         String chron = '0 0 23 * * ?';        
         system.schedule('Test Sched', chron, myClass);
         test.stopTest();
    }
}