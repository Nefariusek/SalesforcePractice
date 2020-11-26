public with sharing class QuoteCalloutUtil {
    public static void removeOpportunitiesWithID() {
        Set<Id> oppToDeleteList = new Set<Id>();
        Set<Quote> quoSet = getQuotesFromApi();
        for (Quote quo : quoSet) {
            oppToDeleteList.add(quo.OpportunityId);
        }
        sendOpportunitiesToDelete(oppToDeleteList);
    }

    public static void sendOpportunitiesToDelete(Set<Id> oppToDeleteList) {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        String sfdcBaseURL = URL.getSalesforceBaseUrl().toExternalForm() + '/services/apexrest/Opportunity/';
        String myBody = JSON.serialize(oppToDeleteList);
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        req.setMethod('POST');
        req.setHeader('Content-Length', String.valueOf(myBody.length()));
        req.setEndpoint(sfdcBaseURL);
        req.setBody(myBody);
        HttpResponse res = http.send(req);
        System.debug(res);
    }

    public static Set<Quote> getQuotesFromApi() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        String sfdcBaseURL = URL.getSalesforceBaseUrl().toExternalForm() + '/services/apexrest/Quote/';
        request.setEndpoint(sfdcBaseURL);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        Set<Quote> quoSet = (Set<Quote>) JSON.deserialize(response.getBody(), Set<Quote>.class);
        return quoSet;
    }

    public static void getPawelQuotesFromApi() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String sfdcBaseURL = 'callout:PawelRESTnc/services/apexrest/Quote';
        request.setEndpoint(sfdcBaseURL);
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        HttpResponse response = http.send(request);
        System.debug(response);
    }
}
