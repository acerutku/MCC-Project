public class CaseTriggerHandler {
    public static void createCase(List<Case> newCases) {
        // Query for existing cases with the same origin
        List<Case> existingCases = [
            SELECT Id,AccountId, Origin FROM Case];

        // Set the parent ID of the new cases to the ID of the existing cases with the same origin
        for (Case c : newCases) {
            
            for (Case ec : existingCases) {
                if (ec.Origin == c.Origin && ec.AccountId == c.AccountId) {   
                      c.ParentId = ec.Id;        
                    break;                      
                }
            }
        }
    }
}