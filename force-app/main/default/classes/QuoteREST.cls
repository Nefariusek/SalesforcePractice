@RestResource(urlMapping='/Quote/*')
global with sharing class QuoteREST {
    @HttpGet
    global static List<Quote> getLastWeekQuotes() {
        QuoteController controller = new QuoteController();
        return controller.getQuotes();
    }
}
