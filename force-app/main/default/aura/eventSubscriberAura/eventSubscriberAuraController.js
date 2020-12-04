({
    onInit: function (component, event, helper) {
        const empApi = component.find('empApi');
        empApi.onError(
            $A.getCallback((error) => {
                console.error('EMP API error: ', JSON.stringify(error));
            })
        );
        component.set('v.columns', [
            { label: 'Request', fieldName: 'request', type: 'text' },
            { label: 'Response', fieldName: 'response', type: 'text' },
            { label: 'Status Code', fieldName: 'statusCode', type: 'number' }
        ]);
    },
    subscribe: function (component, event, helper) {
        const empApi = component.find('empApi');
        const channel = component.find('channel').get('v.value');
        const replayId = -1;
        let logsArr = [{ request: 'jakis', response: 'jakas', statusCode: 200 }];

        empApi
            .subscribe(
                channel,
                replayId,
                $A.getCallback((eventReceived) => {
                    console.log('Received event ', JSON.stringify(eventReceived));
                    logsArr = [
                        ...logsArr,
                        {
                            request: eventReceived.data.payload.Request__c,
                            response: eventReceived.data.payload.Response__c,
                            statusCode: eventReceived.data.payload.Status_Code__c
                        }
                    ];
                    component.set('v.data', logsArr);
                })
            )
            .then((subscription) => {
                console.log('Subscription request sent to: ', subscription.channel);
                component.set('v.subscription', subscription);
            });
    },

    unsubscribe: function (component, event, helper) {
        const empApi = component.find('empApi');
        const subscription = component.get('v.subscription');

        empApi.unsubscribe(
            subscription,
            $A.getCallback((unsubscribed) => {
                console.log('Unsubscribed from channel ' + unsubscribed.subscription);
                component.set('v.subscription', null);
            })
        );
    }
});
