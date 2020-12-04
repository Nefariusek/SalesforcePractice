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

    @isTest
    static void testInvalidWebserviceLogInsertion() {
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Test.setMock(HttpCalloutMock.class, new LoggerHttpCalloutMock());
        HttpResponse response = LoggerHttpCalloutMock.respondError(request);
        WebserviceObjectLogger logger = new WebserviceObjectLogger();

        Boolean isException = false;
        String eMessage;
        Test.startTest();
        try {
            logger.logMessage(request, response);
        } catch (DmlException e) {
            isException = true;
            eMessage = e.getMessage();
        }

        Test.stopTest();

        List<WebserviceLog__c> logs = [SELECT id FROM WebserviceLog__c];
        System.assertEquals(true, isException, 'Exception should be true');
        System.assertEquals(
            'Insert failed. First exception on row 0; first error: NUMBER_OUTSIDE_VALID_RANGE, Status Code: value outside of valid range on numeric field: 9999: [Status_Code__c]',
            eMessage
        );
        System.assertEquals(0, logs.size());
    }
}
