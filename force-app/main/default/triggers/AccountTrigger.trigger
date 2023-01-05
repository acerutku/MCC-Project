trigger AccountTrigger on Account (after insert,after update) {		
	
    switch on Trigger.operationType{
        when AFTER_INSERT{
            AccountTriggerHandler.createOppForAccount(Trigger.newMap);
        }
        when AFTER_UPDATE{
            AccountTriggerHandler.createOppForAccount(Trigger.newMap);
        }
        
        
    }
}