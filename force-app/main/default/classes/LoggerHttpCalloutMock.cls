@isTest
global class LoggerHttpCalloutMock implements HttpCalloutMock {
    global static HttpResponse respond(HttpRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody(
            '[{"attributes":{"type":"Opportunity","url":"/services/data/v50.0/sobjects/Opportunity/00609000001rjK3AAI"},"Id":"00609000001rjK3AAI","Name":"Farmers Coop. of Florida-"},{"attributes":{"type":"Opportunity","url":"/services/data/v50.0/sobjects/Opportunity/006090000037ne2AAA"},"Id":"006090000037ne2AAA","Name":"United Oil Emergency Generators"},{"attributes":{"type":"Opportunity","url":"/services/data/v50.0/sobjects/Opportunity/006090000037ne3AAA"},"Id":"006090000037ne3AAA","Name":"Grand Hotels SLA"},{"attributes":{"type":"Opportunity","url":"/services/data/v50.0/sobjects/Opportunity/006090000037ne4AAA"},"Id":"006090000037ne4AAA","Name":"United Oil Standby Generators"}]'
        );
        response.setStatusCode(200);
        return response;
    }

    global static HttpResponse respondError(HttpRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody(
            '[{"attributes":{"type":"Opportunity","url":"/services/data/v50.0/sobjects/Opportunity/00609000001rjK3AAI"},"Id":"00609000001rjK3AAI","Name":"Farmers Coop. of Florida-"},{"attributes":{"type":"Opportunity","url":"/services/data/v50.0/sobjects/Opportunity/006090000037ne2AAA"},"Id":"006090000037ne2AAA","Name":"United Oil Emergency Generators"},{"attributes":{"type":"Opportunity","url":"/services/data/v50.0/sobjects/Opportunity/006090000037ne3AAA"},"Id":"006090000037ne3AAA","Name":"Grand Hotels SLA"},{"attributes":{"type":"Opportunity","url":"/services/data/v50.0/sobjects/Opportunity/006090000037ne4AAA"},"Id":"006090000037ne4AAA","Name":"United Oil Standby Generators"}]'
        );
        response.setStatusCode(9999);
        return response;
    }
}
