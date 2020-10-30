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
        List<Contact> contactList = newItems;

        ValidateMailingCity(contactList);
    }
 
    public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
 
    public void BeforeDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterInsert(Map<Id, SObject> newItems) {}
 
    public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}
 
    public void AfterDelete(Map<Id, SObject> oldItems) {}
 
    public void AfterUndelete(Map<Id, SObject> oldItems) {}

    public void ValidateMailingCity(List<Contact> contactList){
        for(Contact contact : contactList){
            Boolean isValid = CalculatePropabilityOfValidCity(contact.MailingCity);
            if(isValid){  
                Account accToUpdate = [SELECT BillingCity FROM Account WHERE Id=:contact.AccountId];
                accToUpdate.BillingCity = contact.MailingCity;
                update accToUpdate;
                System.debug('Billing City updated');
            }else{
                contact.addError('This Contact has wrong city name');
            }
        }
    }

    public Boolean CalculatePropabilityOfValidCity(String cityToValidate){
        String[] validCities = new String[]{'Gdańsk', 'Szczecin', 'Bydgoszcz', 'Lubin', 'Białystok', 'Katowice'};
        for(String city: validCities){
            Integer distance = cityToValidate.getLevenshteinDistance(city);
            Integer dlugosc = cityTOValidate.length();
            Double propability = ((Double)dlugosc)/(dlugosc+distance);
            System.debug('Prawdopodobieństwo' + propability);
            if(propability>=0.80){
                return true;
            }
        }
        return false;
    }
}