AppLogger logger = (AppLogger) WebserviceLoggerInjector.instantiate();
System.debug(logger.logMessage());

DICallout.sendRequestToExternalService();
