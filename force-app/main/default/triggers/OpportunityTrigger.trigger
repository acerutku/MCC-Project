trigger OpportunityTrigger on Opportunity (before insert,before update, after update) {
   switch on Trigger.operationType{

        when BEFORE_UPDATE{
            OppTriggerHandler.oppValidation(Trigger.new,Trigger.oldMap);
        }
       when  BEFORE_INSERT{
           OppTriggerHandler.oppCreateValidation(Trigger.new);
       }
       when  AFTER_UPDATE{
           OppTriggerHandler.oppNewTask(Trigger.new);
       }
       
        
        
    }
}