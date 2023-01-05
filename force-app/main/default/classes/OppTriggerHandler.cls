public class OppTriggerHandler {
    
    public static void oppValidation(List<Opportunity> updOpp, Map<Id, Opportunity> oldOppMap){

        // Iterate over the list of new opportunities
        for (Opportunity opp : updOpp) {
            // Get the old opportunity from the map
            Opportunity oldOpportunity = oldOppMap.get(opp.AccountId);
            
            // Check if the Id field is empty
            if (opp.AccountId == null) {
                // Add an error to the record if the status is being changed to "Closed Won"
                if (opp.StageName == 'Closed Won') {
                    opp.StageName.addError('Cannot change the status to "Closed Won" if the Id field is empty');
                }
            }
         }
        
    }
    public static void oppCreateValidation(List<Opportunity> newOpp){
        for(Opportunity opp : newOpp){
            If(opp.StageName == 'Closed Won' || opp.StageName == 'Closed Lost'){
                opp.StageName.addError('Cannot Create a new Opp with a Stage of "Closed Won-Closed Lost"');
            }
        }
    }
    public static void oppNewTask(List<Opportunity> updateOpp){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Opportunity opp: updateOpp){
            if(opp.StageName=='Closed Won'){
                oppList.add(opp);
            }
        }
        List<Task> taskList = new List<Task>();
        for(Opportunity crt : oppList){       
                Task newTask = new Task(Subject= 'Follow up Task',
                                        ActivityDate= crt.CloseDate.addMonths(1),
                                        WhatId= crt.Id,
                                        OwnerId= crt.OwnerId);
                taskList.add(newTask);    
            
            insert taskList;
        
        }
    }
}