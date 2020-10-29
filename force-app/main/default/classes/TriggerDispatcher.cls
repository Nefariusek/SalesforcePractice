public class TriggerDispatcher {
  /*
        Call this method from your trigger, passing in an instance of a trigger handler which implements ITriggerHandler.
        This method will fire the appropriate methods on the handler depending on the trigger context.
    */
  public static void Run(ITriggerHandler handler) {
    // Check to see if the trigger has been disabled. If it has, return
    if (handler.IsDisabled())
      return;

    // Detect the current trigger context and fire the relevant methods on the trigger handler:

    // Before trigger logic
    if (Trigger.IsBefore) {
      if (Trigger.IsInsert)
        handler.BeforeInsert(Trigger.new);

      if (Trigger.IsUpdate)
        handler.BeforeUpdate(Trigger.newMap, Trigger.oldMap);

      if (Trigger.IsDelete)
        handler.BeforeDelete(Trigger.oldMap);
    }

    // After trigger logic
    if (Trigger.IsAfter) {
      if (Trigger.IsInsert)
        handler.AfterInsert(Trigger.newMap);

      if (Trigger.IsUpdate)
        handler.AfterUpdate(Trigger.newMap, Trigger.oldMap);

      if (Trigger.IsDelete)
        handler.AfterDelete(Trigger.oldMap);

      if (Trigger.isUndelete)
        handler.AfterUndelete(Trigger.oldMap);
    }
  }
}
