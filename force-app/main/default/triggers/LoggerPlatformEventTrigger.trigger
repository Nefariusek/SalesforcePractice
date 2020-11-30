trigger LoggerPlatformEventTrigger on Logger_Event__e(after insert) {
    LoggerPlatformEventTriggerHelper.insertWebserviceLogRecords(Trigger.New);
}
