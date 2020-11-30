public with sharing class LwcLookupController {
    @AuraEnabled(cacheable=true)
    public static List<LookupSearchResult> getRecords(
        String searchString,
        String objectName,
        String titleField,
        String firstSubtitleField
    ) {
        List<List<SObject>> queryResult = search.query(
            'FIND :searchString IN ALL FIELDS RETURNING ' +
            objectName +
            '(' +
            titleField +
            ',' +
            firstSubtitleField +
            ') LIMIT 5'
        );
        System.debug('SZPAK wynik' + queryResult);
        List<LookupSearchResult> results = new List<LookupSearchResult>();
        for (sObject record : queryResult[0]) {
            results.add(
                new LookupSearchResult(
                    record.id,
                    objectName,
                    (String) record.get(titleField),
                    (String) record.get(firstSubtitleField)
                )
            );
        }
        System.debug('SZPAK wrapped' + results);
        return results;
    }
}