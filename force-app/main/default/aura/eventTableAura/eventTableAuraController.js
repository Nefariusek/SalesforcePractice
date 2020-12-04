({
    onInit: function (component, event, helper) {
        component.set('v.columns', [
            { label: 'Request', fieldName: 'request', type: 'text' },
            { label: 'Response', fieldName: 'response', type: 'text' },
            { label: 'Status Code', fieldName: 'statusCode', type: 'number' }
        ]);
    }
});
