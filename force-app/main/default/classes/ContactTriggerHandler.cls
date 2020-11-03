public with sharing class ContactTriggerHandler implements ITriggerHandler {
    // Allows unit tests (or other code) to disable this trigger for the transaction
    public static Boolean TriggerDisabled = false;
    public static final String[] VALID_CITIES = new List<String>{
        'Gdańsk',
        'Szczecin',
        'Bydgoszcz',
        'Lubin',
        'Białystok',
        'Katowice'
    };
    /*
        Checks to see if the trigger has been disabled either by custom setting or by running code
    */
    public Boolean IsDisabled() {
        return false;
    }

    public void BeforeInsert(List<SObject> newItems) {
    }

    public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
    }

    public void BeforeDelete(Map<Id, SObject> oldItems) {
    }

    public void AfterInsert(Map<Id, SObject> newItems) {
        List<Contact> contactList = (List<Contact>) newItems.values();

        validateMailingCity(contactList);
    }

    public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
        List<Contact> contactList = (List<Contact>) newItems.values();

        validateMailingCity(contactList);
    }

    public void AfterDelete(Map<Id, SObject> oldItems) {
    }

    public void AfterUndelete(Map<Id, SObject> oldItems) {
    }

    public void validateMailingCity(List<Contact> contactList) {
        Set<Id> accIds = new Set<Id>();
        for (Contact contact : contactList) {
            accIds.add(contact.AccountId);
        }
        Map<Id, Account> accToUpdateMap = new Map<Id, Account>([SELECT BillingCity FROM Account WHERE Id IN :accIds]);
        for (Contact contact : contactList) {
            if (calculatePropabilityOfValidCity(contact.MailingCity)) {
                Account accToUpdate = accToUpdateMap.get(contact.AccountId);
                accToUpdate.BillingCity = contact.MailingCity;
                System.debug('Billing City updated ' + accToUpdate.BillingCity);
            } else {
                contact.addError('This Contact has wrong city name');
            }
        }
        if (accToUpdateMap.size() > 0) {
            update accToUpdateMap.values();
        }
    }

    public Boolean calculatePropabilityOfValidCity(String cityToValidate) {
        if (String.isBlank(cityToValidate)) {
            return false;
        }
        for (String city : VALID_CITIES) {
            Double distance = cityToValidate.getLevenshteinDistance(city);
            Double divider = Math.max(city.length(), cityToValidate.length());
            Double propability = ((divider - distance) / divider) * 100;
            if (propability >= 80) {
                return true;
            }
        }
        return false;
    }
}
