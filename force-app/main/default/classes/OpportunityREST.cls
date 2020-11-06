@RestResource(urlMapping='/Opportunity/*')
global with sharing class OpportunityREST {
    @HttpDelete
    global static void deleteOpportunity() {
        String opportunityId = RestContext.request.params.get('opportunityId');
        //String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Opportunity opp = [SELECT Id FROM Opportunity WHERE Id = :opportunityId];
        delete opp;
    }

    @HttpPost
    global static void deleteOpportunities() {
        System.debug('SZPAK @httppost request' + RestContext.request);
        System.debug('SZPAK @httppost body' + RestContext.request.requestBody);
        System.debug('SZPAK @httppost params' + RestContext.request.params);
        Set<String> wrapperList = RestContext.request.params.keySet();
        String wrapperString = wrapperList.toString().replaceAll('\\{|\\[|\\"|\\]|\\=|\\}', '');
        List<String> listOfIds = wrapperstring.split(',');

        List<Opportunity> opp = [SELECT Id FROM Opportunity WHERE Id IN :listOfIds];
        delete opp;
    }
}
