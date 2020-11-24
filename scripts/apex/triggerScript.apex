// Opportunity opp = new Opportunity(Name = 'Testowy4001', StageName = 'Prospecting', CloseDate = Date.today().addDays(1));
// Opportunity opp2 = new Opportunity(
//     Name = 'Testowy4002',
//     StageName = 'Prospecting',
//     CloseDate = Date.today().addDays(1)
// );
// Opportunity opp3 = new Opportunity(
//     Name = 'Testowy4003',
//     StageName = 'Prospecting',
//     CloseDate = Date.today().addDays(1)
// );

// insert opp;
// insert opp2;
// insert opp3;

// System.debug('ID konta' + opp.Id);
// System.debug('ID 2 konta' + opp2.Id);
// // List<Id> listOfIds = new List<Id>();
// // listOfIds.add(opp.Id);
// // String oppId = '006090000023aReAAI';
// // OpportunityDeletionAsync.deleteQuoteParentOpportunityAsync(oppId);
// Quote quo = new Quote(Name = 'TestowyQuo101', OpportunityId = opp.Id);
// Quote quo2 = new Quote(Name = 'TestowyQuo102', OpportunityId = opp2.Id);
// Quote quo3 = new Quote(Name = 'TestowyQuo102', OpportunityId = opp3.Id);
// List<Quote> quoList = new List<Quote>();
// List<Quote> quoList2 = new List<Quote>();
// quoList.add(quo);
// quoList.add(quo2);
// quoList.add(quo3);
// quoList2.add(quo);
// quoList2.add(quo2);
// insert quoList;

//List<Opportunity> opp = [SELECT Id FROM Opportunity WHERE Id IN :listOfIds];
//System.debug(opp)
//List<Id> listOfIds = new List<Id>();
//listOfIds.add(quo.Id);

//System.debug('ID quo' + quo.Id);

//delete quoList2;

//System.debug(QuoteCalloutUtil.getQuotesFromApi());
//QuoteCalloutUtil.getPawelQuotesFromApi();
//System.debug(QuoteCalloutUtil.getPawelQuotesFromApi());
LwcLookupController.getRecords('Ko', 'Account', 'Name, BillingCity');
