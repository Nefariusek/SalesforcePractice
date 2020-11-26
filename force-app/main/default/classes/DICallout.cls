public class DICallout {
    public static void sendRequestToExternalService() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String sfdcBaseURL = 'callout:PawelRESTnc/services/apexrest/Opportunity';
        request.setEndpoint(sfdcBaseURL);
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        HttpResponse response = http.send(request);

        AppLogger logger = (AppLogger) WebserviceLoggerInjector.instantiate();
        logger.logMessage(request, response);
        //System.debug(logger.logMessage());
    }
}
