public with sharing class OpportunityDeletionAsync {
    @future(callout=true)
    public static void deleteQuoteParentOpportunityAsync(List<Id> oppToDeleteList) {
        Http http = new Http();
        HttpRequest req = new HttpRequest();

        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        String sfdcBaseURL = URL.getSalesforceBaseUrl().toExternalForm() + '/services/apexrest/Opportunity/';
        req.setEndpoint(sfdcBaseURL);
        req.setMethod('POST');
        String myBody = JSON.serialize(oppToDeleteList);
        System.debug('MPYC myBody ' + myBody);
        req.setBody(myBody);
        req.setHeader('Content-Type', 'application/json;charset=UTF-8');
        System.debug('MPYC req body ' + req.getBody());
        HttpResponse res = http.send(req);
        System.debug('MPYC res ' + res);
    }
}
