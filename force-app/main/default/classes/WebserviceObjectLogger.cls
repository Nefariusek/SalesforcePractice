public class WebserviceObjectLogger implements AppLogger {
    public void logMessage(HttpRequest request, HttpResponse response) {
        WebserviceLog__c logToInsert = new WebserviceLog__c(
            Name = 'RequestLog',
            Request__c = request.toString(),
            Response__c = response.getBody(),
            Status_Code__c = response.getStatusCode()
        );
        insert logToInsert;
    }
}
