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

        for(Contact contact : (List<Contact>) Trigger.new){
           // System.debug(contact.MailingCity);
            Integer distance = contact.MailingCity.getLevenshteinDistance('Gdańsk');
           // System.debug('Dystans' + distance);
            Integer dlugosc = contact.MailingCity.length();
           // System.debug(dlugosc);
            Double propability = ((Double)dlugosc)/(dlugosc+distance);
            System.debug('Prawdopodobieństwo' + propability);
            //String id = contact.AccountId;
           
            //String miasto = id.BillingCity;
            //System.debug('id do zmiany' + accToUpdate);
         
            if(propability >= 0.80){ 
                //System.debug('i co i jajco');
                Account accToUpdate = [SELECT BillingCity FROM Account WHERE Id=:contact.AccountId];
                accToUpdate.BillingCity = contact.MailingCity;
                update accToUpdate;
            }else{
               // System.debug('jajeczko');
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