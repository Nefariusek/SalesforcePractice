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
        req.setBody(myBody);
        System.debug('SZPAK async body ' + myBody);
        req.setHeader('Content-Length', String.valueOf(myBody.length()));
        HttpResponse res = http.send(req);
        System.debug('SZPAK async res' + myBody);
    }
}
