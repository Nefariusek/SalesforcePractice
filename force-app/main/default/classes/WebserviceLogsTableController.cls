public with sharing class WebserviceLogsTableController {
    List<WebserviceLog__c> logs;

    public List<WebserviceLog__c> getLogs() {
        logs = [SELECT Request__c, Response__c, Status_Code__c FROM WebserviceLog__c LIMIT 5];
        return logs;
    }
}
