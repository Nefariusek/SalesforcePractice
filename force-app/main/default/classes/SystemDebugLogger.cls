public class SystemDebugLogger implements AppLogger {
    public void logMessage(HttpRequest request, HttpResponse response) {
        System.debug('SZPAK log request: ' + request);
        System.debug('SZPAK log status code: ' + response.getStatusCode());
        System.debug('SZPAK log response: ' + JSON.serializePretty(response.getBody()));
    }
}
