public class QuoteTriggerHandler implements ITriggerHandler {
    // Allows unit tests (or other code) to disable this trigger for the transaction
    public static Boolean TriggerDisabled = false;

    /*
        Checks to see if the trigger has been disabled either by custom setting or by running code
    */
    public Boolean IsDisabled() {
        return true;
    }

    public void BeforeInsert(List<SObject> newItems) {
    }

    public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
    }

    public void BeforeDelete(Map<Id, SObject> oldItems) {
    }

    public void AfterInsert(Map<Id, SObject> newItems) {
    }

    public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
    }

    public void AfterDelete(Map<Id, SObject> oldItems) {
        List<Quote> quoteList = (List<Quote>) oldItems.values();
        System.debug('Pierwszy debug');
        quoteParentsDeletion(quoteList);
    }

    public void AfterUndelete(Map<Id, SObject> oldItems) {
    }

    public void quoteParentsDeletion(List<Quote> quoteListOld) {
        System.debug('Lista ' + quoteListOld);
        List<Quote> currentQuotes = [SELECT Id FROM Quote];
        List<Quote> deletedQuotes = [
            SELECT Id, OpportunityId
            FROM Quote
            WHERE ID IN :quoteListOld AND ID NOT IN :currentQuotes
            ALL ROWS
        ];
        System.debug('Drugi debug' + deletedQuotes);
        List<Id> oppToDeleteIds = new List<Id>();
        for (Quote quo : deletedQuotes) {
            oppToDeleteIds.add(quo.OpportunityId);
        }
        System.debug('Trzeci debug' + oppToDeleteIds);
        OpportunityDeletionAsync.deleteQuoteParentOpportunityAsync(oppToDeleteIds);
        System.debug('Ostatni debug');
    }
}
