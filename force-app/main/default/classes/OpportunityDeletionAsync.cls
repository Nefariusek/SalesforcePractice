public with sharing class OpportunityDeletionAsync {
    @future(callout=true)
    public static void deleteQuoteParentOpportunityAsync(List<Id> oppToDeleteList) {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setHeader(
            'Authorization',
            'Bearer ' +
            '00D09000002X1si!AQIAQOCcW5eEDclGyV.n8D3hZjJVirdP3.2yuu8upU0v04UtWQ.WqiXFTyIyD1QxJ3QLHSzrAX0Eo7hS0Po5hg2sxX5c.KAi'
        );
        //String oppId = '006090000023aReAAI';
        for (Id oppId : oppToDeleteList) {
            req.setEndpoint(
                'https://polsource8-dev-ed.my.salesforce.com/services/apexrest/Opportunity/?opportunityId=' + oppId
            );
            req.setMethod('DELETE');
            HttpResponse res = http.send(req);
            System.debug('NaszResponse ' + res);
        }
    }
}
