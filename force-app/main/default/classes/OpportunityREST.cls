@RestResource(urlMapping='/Opportunity/')
global with sharing class OpportunityREST {
    @HttpGet
    global static List<Opportunity> getOpps() {
        List<Opportunity> oppList = [SELECT Name FROM Opportunity];
        return oppList;
    }

    // @HttpDelete
    // global static void deleteOpportunity() {
    //     String opportunityId = RestContext.request.params.get('opportunityId');
    //     //String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
    //     Opportunity opp = [SELECT Id FROM Opportunity WHERE Id = :opportunityId];
    //     delete opp;
    // }

    @HttpPost
    global static void deleteOpportunities(List<Id> oppToDeleteList) {
        System.debug('MPYC oppToDeleteList ' + oppToDeleteList);
        RestRequest req = RestContext.request;

        // Set<String> wrapperList = RestContext.request.params.keySet();
        // String wrapperString = wrapperList.toString().replaceAll('\\{|\\[|\\"|\\]|\\=|\\}', '');
        // List<String> listOfIds = wrapperstring.split(',');
        System.debug('test lista ' + oppToDeleteList);
        System.debug('test requestBody ' + req.requestBody);
        List<Opportunity> opp = [SELECT Id FROM Opportunity WHERE Id IN :oppToDeleteList];
        delete opp;
    }
}
