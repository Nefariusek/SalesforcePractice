import { LightningElement, track } from 'lwc';
import { subscribe, unsubscribe, onError } from 'lightning/empApi';

export default class EmpApiLWC extends LightningElement {
    channelName = '/event/Logger_Event__e';
    isSubscribeDisabled = false;
    isUnsubscribeDisabled = !this.isSubscribeDisabled;
    @track logsArr = [{ request: 'jakis', response: 'jakas', statusCode: 200 }];
    subscription = {};

    handleChannelName(event) {
        this.channelName = event.target.value;
    }

    connectedCallback() {
        this.registerErrorListener();
    }

    handleSubscribe() {
        const messageCallback = (res) => {
            console.log('New message received: ', JSON.stringify(res));
            this.logsArr.push({
                request: JSON.stringify(res.data.payload.Request__c),
                response: JSON.stringify(res.data.payload.Response__c),
                statusCode: JSON.stringify(res.data.payload.Status_Code__c)
            });
            console.log('SZPAK ****************');
            console.log(this.logsArr);
        };

        subscribe(this.channelName, -1, messageCallback).then((res) => {
            console.log('Subscription request sent to: ', JSON.stringify(res.channel));
            this.subscription = res;
            this.toggleSubscribeButton(true);
        });
    }

    handleUnsubscribe() {
        this.toggleSubscribeButton(false);

        unsubscribe(this.subscription, (res) => {
            console.log('unsubscribe() response: ', JSON.stringify(res));
        });
    }

    toggleSubscribeButton(enable) {
        this.isSubscribeDisabled = enable;
        this.isUnsubscribeDisabled = !enable;
    }

    registerErrorListener() {
        onError((err) => {
            console.log('Received error from server: ', JSON.stringify(err));
        });
    }
}
