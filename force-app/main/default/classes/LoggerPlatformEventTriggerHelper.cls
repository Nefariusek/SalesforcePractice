public with sharing class LoggerPlatformEventTriggerHelper {
    public static void insertWebserviceLogRecords(List<Logger_Event__e> eventLogs) {
        List<WebserviceLog__c> logsToInsert = new List<WebserviceLog__c>();
        for (Logger_Event__e event : eventLogs) {
            WebserviceLog__c logToInsert = new WebserviceLog__c(
                Name = 'RequestLogTrigger',
                Request__c = event.Request__c,
                Response__c = event.Response__c,
                Status_Code__c = event.Status_Code__c
            );
            logsToInsert.add(logToInsert);
        }
        insert logsToInsert;
    }
}
