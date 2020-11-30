public class LoggerPlatformEventCreator implements AppLogger {
    public void logMessage(HttpRequest request, HttpResponse Response) {
        Logger_Event__e logEvent = new Logger_Event__e(
            Request__c = request.toString(),
            Response__c = response.getBody(),
            Status_Code__c = response.getStatusCode()
        );

        Database.SaveResult result = EventBus.publish(logEvent);

        if (result.isSuccess()) {
            System.debug('Successfully published event.');
        } else {
            for (Database.Error err : result.getErrors()) {
                System.debug('Error returned: ' + err.getStatusCode() + ' - ' + err.getMessage());
            }
        }
    }
}
