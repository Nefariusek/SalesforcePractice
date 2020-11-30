@isTest
public with sharing class WebserviceObjectLoggerTest {
    @isTest
    static void testWebserviceLogInsertion() {
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Test.setMock(HttpCalloutMock.class, new LoggerHttpCalloutMock());
        HttpResponse response = LoggerHttpCalloutMock.respond(request);
        WebserviceObjectLogger logger = new WebserviceObjectLogger();

        Test.startTest();
        logger.logMessage(request, response);
        Test.stopTest();

        List<WebserviceLog__c> logs = [SELECT id FROM WebserviceLog__c];
        System.assertEquals(1, logs.size());
    }
}
