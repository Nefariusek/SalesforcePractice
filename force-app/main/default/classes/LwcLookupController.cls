public with sharing class LwcLookupController {
    @AuraEnabled(cacheable=true)
    public static List<SObject> getRecords(String searchString, String objectName, String fieldsName) {
        // List<SObject> results = Database.query(
        //     'SELECT Id, Name FROM ' +
        //     objectName +
        //     ' WHERE Name LIKE ' +
        //     '\'' +
        //     searchString +
        //     '%\''
        // );
        //String fieldsString = 'Name, BillingCity';
        List<List<SObject>> results = search.query(
            'FIND :searchString IN ALL FIELDS RETURNING ' +
            objectName +
            '(' +
            fieldsName +
            ') LIMIT 5'
        );
        System.debug('SZPAK wynik' + results);
        return results[0];
    }
}
