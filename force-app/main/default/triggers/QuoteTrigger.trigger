trigger QuoteTrigger on Quote(
    before insert,
    before update,
    before delete,
    after insert,
    after update,
    after delete,
    after undelete
) {
    TriggerDispatcher.Run(new QuoteTriggerHandler());
}
