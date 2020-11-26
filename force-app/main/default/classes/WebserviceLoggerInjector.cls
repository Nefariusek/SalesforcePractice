public class WebserviceLoggerInjector {
    public static Object instantiate() {
        Type t = Type.forName(WebserviceLoggerSettings__c.getInstance().LoggerMethod__c);
        return t.newInstance();
    }
}
