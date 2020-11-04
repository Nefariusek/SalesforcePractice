public with sharing class OpportunityTriggerHandler implements ITriggerHandler {
    public static Boolean TriggerDisabled = false;

    public Boolean IsDisabled() {
        return true;
    }

    public void BeforeInsert(List<SObject> newItems) {
    }
    public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
        Map<Id, Opportunity> oldOppMap = (Map<Id, Opportunity>) oldItems;
        Map<Id, Opportunity> newOppMap = (Map<Id, Opportunity>) newItems;
        Map<Id, Opportunity> filteredResults = filterClosedWonOpportunities(oldOppMap, newOppMap);

        opportunityStageUpdate(filteredResults);
    }

    public void BeforeDelete(Map<Id, SObject> oldItems) {
    }

    public void AfterInsert(Map<Id, SObject> newItems) {
    }

    public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
    }

    public void AfterDelete(Map<Id, SObject> oldItems) {
    }

    public void AfterUndelete(Map<Id, SObject> oldItems) {
    }

    private void opportunityStageUpdate(Map<Id, Opportunity> filteredResults) {
        Set<Id> accIds = new Set<Id>();
        for (Opportunity opp : filteredResults.values()) {
            accIds.add(opp.AccountId);
            opp.CloseDate = Date.today();
        }
        List<Opportunity> listOfRelatedOpps = [
            SELECT StageName, AccountId, CloseDate
            FROM Opportunity
            WHERE AccountId IN :accIds AND Id NOT IN :filteredResults.keySet()
        ];
        for (Opportunity opp : listOfRelatedOpps) {
            opp.StageName = 'Closed Lost';
        }
        if (listOfRelatedOpps.size() > 0) {
            update listOfRelatedOpps;
        }
    }
    private Map<Id, Opportunity> filterClosedWonOpportunities(
        Map<Id, Opportunity> opportunityNewMap,
        Map<Id, Opportunity> opportunityOldMap
    ) {
        Map<Id, Opportunity> filteredResults = new Map<Id, Opportunity>();
        for (Opportunity eachOpp : opportunityNewMap.values()) {
            if (eachOpp.StageName == 'Closed Won' && opportunityOldMap.get(eachOpp.Id).StageName == 'Needs Analysis') {
                filteredResults.put(eachOpp.Id, eachOpp);
            }
        }
        return filteredResults;
    }
}
