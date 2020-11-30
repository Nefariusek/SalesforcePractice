public class SystemDebugLogger implements AppLogger {
    public void logMessage(HttpRequest request, HttpResponse response) {
        System.debug('Log request: ' + request);
        System.debug('Log status code: ' + response.getStatusCode());
        System.debug('Log response: ' + response.getBody());
    }
}
