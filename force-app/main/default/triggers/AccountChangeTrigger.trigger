trigger AccountChangeTrigger on AccountChangeEvent(after insert) {
    TriggerDispatcher.Run(new AccountTriggerHandler());
}
