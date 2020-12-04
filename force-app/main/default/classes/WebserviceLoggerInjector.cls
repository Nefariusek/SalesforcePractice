public class WebserviceLoggerInjector {
    public static Object instantiate(Boolean setting) {
        Type t;
        if (setting) {
            t = Type.forName(WebserviceLoggerSettings__c.getInstance().LoggerMethod__c);
        } else {
            DI_Metadata__mdt[] metadata = [SELECT LogMethod__c FROM DI_Metadata__mdt];
            t = Type.forName(metadata[0].LogMethod__c);
        }
        return t.newInstance();
    }
}
