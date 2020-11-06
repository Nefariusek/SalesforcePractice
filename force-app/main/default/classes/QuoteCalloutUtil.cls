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
        String username = 'spakula98@gmail.com';
        String password = 'qwertyuiop1';

        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        System.debug('Tutaj');
        String sfdcBaseURL = 'callout:PawelRESTnc/services/apexrest/Quote';
        request.setEndpoint(sfdcBaseURL);
        //request.setEndpoint('https://polsource5-dev-ed.lightning.force.com/services/apexrest/Quote');
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        //request.setHeader('Authorization', authorizationHeader);
        System.debug('MPYC endpoint ' + request);
        HttpResponse response = http.send(request);
        System.debug('MPYC response ' + response);
        System.debug(response.getBody());
        while (response.getStatusCode() == 302) {
            request.setEndpoint(response.getHeader('Location'));
            response = new Http().send(request);
        }
        //Set<Quote> quoSet = (Set<Quote>) JSON.deserialize(response.getBody(), Set<Quote>.class);
        //return quoSet;

        // Http http = new Http();
        // HttpRequest req = new HttpRequest();
        // req.setEndpoint('callout:PawelRESTnc/services/data/v50.0');
        // req.setMethod('GET');
        // req.setTimeout(30000);
        // HttpResponse res = http.send(req);
        // System.debug('Response Body===========' + res + res.getBody());
    }
}
