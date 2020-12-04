@isTest
public with sharing class LoggerPlatformEventCreatorTest {
    @TestSetup
    static void setup() {
    }

    @isTest
    static void testPlaformEventLogger() {
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Test.setMock(HttpCalloutMock.class, new LoggerHttpCalloutMock());
        HttpResponse response = LoggerHttpCalloutMock.respond(request);
        LoggerPlatformEventCreator logger = new LoggerPlatformEventCreator();

        Test.startTest();
        logger.logMessage(request, response);
        Test.stopTest();

        List<WebserviceLog__c> logs = [SELECT id FROM WebserviceLog__c];
        System.assertEquals(1, logs.size());
    }

    @isTest
    static void testInvalidPlatformEvent() {
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Test.setMock(HttpCalloutMock.class, new LoggerHttpCalloutMock());
        HttpResponse response = LoggerHttpCalloutMock.respondError(request);
        LoggerPlatformEventCreator logger = new LoggerPlatformEventCreator();

        Boolean isException = false;
        String eMessage;
        Test.startTest();
        try {
            logger.logMessage(request, response);
        } catch (MyException e) {
            isException = true;
            eMessage = e.getMessage();
        }
        Test.stopTest();

        List<WebserviceLog__c> logs = [SELECT id FROM WebserviceLog__c];
        System.assertEquals(true, isException, 'Exception should be true');
        System.assertEquals('Error returned: NUMBER_OUTSIDE_VALID_RANGE - Invalid number', eMessage);
        System.assertEquals(0, logs.size());
    }
}
