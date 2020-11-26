import { LightningElement } from 'lwc';
import { subscribe, unsubscribe, onError } from 'lightning/empApi';

export default class EmpApiLWC extends LightningElement {
    channelName = '/event/Logger_Event__e';
    isSubscribeDisabled = false;
    isUnsubscribeDisabled = !this.isSubscribeDisabled;

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
