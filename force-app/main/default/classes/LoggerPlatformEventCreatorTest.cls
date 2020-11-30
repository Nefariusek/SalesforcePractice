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

    // @isTest
    // static void testInvalidPlatformEvent() {
    //     HttpRequest request = new HttpRequest();
    //     request.setMethod('GET');
    //     request.setHeader('Content-Type', 'application/json;charset=UTF-8');
    //     Test.setMock(HttpCalloutMock.class, new LoggerHttpCalloutMock());
    //     HttpResponse response = LoggerHttpCalloutMock.respond(request);
    //     LoggerPlatformEventCreator logger = new LoggerPlatformEventCreator();

    //     Test.startTest();
    //     logger.logMessage(request, respo);
    //     Test.stopTest();

    //     List<WebserviceLog__c> logs = [SELECT id FROM WebserviceLog__c];
    //     System.assertEquals(1, logs.size());
    // }
}
