AppLogger logger = (AppLogger) WebserviceLoggerInjector.instantiate(true);
System.debug(logger.logMessage());

DICallout.sendRequestToExternalService();
