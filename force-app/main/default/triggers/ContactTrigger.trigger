trigger ContactTrigger on Contact (after insert,after update, after delete, after undelete) {
    switch on Trigger.operationType{
        when AFTER_INSERT{
            ContactTriggerHandler.updateAccountActiveContacts(Trigger.new);
        }
        when AFTER_UPDATE{
            ContactTriggerHandler.updateAccountActiveContacts(Trigger.new);  
        }
        when AFTER_DELETE{
            ContactTriggerHandler.updateAccountActiveContacts(Trigger.old);
        }
        when AFTER_UNDELETE{
            ContactTriggerHandler.updateAccountActiveContacts(Trigger.new);
        }
    }
}