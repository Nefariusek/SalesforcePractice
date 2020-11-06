public with sharing class QuoteController {
    public QuoteController() {
    }

    public List<Quote> getQuotes() {
        return [SELECT OpportunityId FROM Quote WHERE CreatedDate = LAST_N_DAYS:7];
    }
}
