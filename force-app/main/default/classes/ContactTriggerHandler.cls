public with sharing class ContactTriggerHandler implements ITriggerHandler
{
    // Allows unit tests (or other code) to disable this trigger for the transaction
    public static Boolean TriggerDisabled = false;
 
    /*
        Checks to see if the trigger has been disabled either by custom setting or by running code
    */
    public Boolean IsDisabled()
    {
        return false;
    }
 
    public void BeforeInsert(List<Contact> newItems) {
        //List<Contact> contactList = newItems;
        for(Contact contact : (List<Contact>) Trigger.new){
            Integer distance = contact.MailingCity.getLevenshteinDistance('Gdańsk');
            Integer dlugosc = contact.MailingCity.length();
            Double propability = ((Double)dlugosc)/(dlugosc+distance);
            if(propability >= 0.80){  
                Account accToUpdate = [SELECT BillingCity FROM Account WHERE Id=:contact.AccountId];
                accToUpdate.BillingCity = contact.MailingCity;
                update accToUpdate;
            }else{
                contact.addError('This Contact has wrong city name');
            }
        }
    }
 
    public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
 
    public void BeforeDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterInsert(Map<Id, SObject> newItems) {}
 
    public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
 
    public void AfterDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterUndelete(Map<Id, SObject> oldItems) {}

    public void CheckContactMailingCity(){
        
    }
}