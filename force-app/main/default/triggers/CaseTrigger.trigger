trigger CaseTrigger on Case (before insert) {
    switch on Trigger.operationType{
         when BEFORE_INSERT{
            CaseTriggerHandler.createCase(Trigger.new);
        }
    }
}