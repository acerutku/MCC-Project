@isTest
public class SAManagerTest {
	@isTest
    static void testSA (){
       List<SA_detail__c> saList = SAManager.getAllSA();
       List<SA_detail__c> saList2 = SAManager.searchSas('Utku');
       List<SA_detail__c> saList3 = SAManager.searchSas('');
        
    }
}