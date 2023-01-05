public class AccountTriggerHandler {
    public static void createOppForAccount(Map<Id,Account> accNewMap){
        
        
                                     List<Opportunity> oppList = new List<Opportunity>();

        
        for(Account a : [SELECT Id,Name,(SELECT Id FROM Opportunities) FROM Account
                         WHERE Id IN :accNewMap.keySet()]){
                             
                             
                             if(a.Opportunities.isEmpty()){
                                 oppList.add(new Opportunity(Name= a.Name + ' ' + 'Opportunity',
                                                             StageName= 'Prospecting',
                                                             CloseDate= System.today().addMonths(1),
                                                             AccountId= a.Id));
                             }
        }
        if(!oppList.isEmpty()){
            insert oppList;
        }
    }
}