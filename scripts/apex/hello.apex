// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

//string tempvar = 'Enter_your_name_here';
//System.debug('Hello World!');
//System.debug('My name is ' + tempvar);
//AccoutController ac = new AccoutController();
//ac.getAccounts();
//System.debug(ac.getAccounts());
//System.debug(JSON.serializePretty(ac.getAccounts()));
//Account account = new Account(Name = 'Konto Do Testów', BillingCity = 'Gdońsk');
// String accId = '00109000002J0lbAAC';
// Contact[] contact = new List<Contact>{
//     new Contact(LastName = 'Wchodzi1', AccountId = accId, MailingCity = 'Szcczcczzecin'),
//     new Contact(LastName = 'Wchodzi2', AccountId = accId, MailingCity = 'Bytgoasdasdasdasdasasdadsasdasdzcz'),
//     new Contact(LastName = 'Nie wchodzi1', AccountId = accId, MailingCity = 'Gdaasdasdaaeńsk'),
//     new Contact(LastName = 'Wchodzi3', AccountId = accId, MailingCity = 'Gdańsk')
// };
// //insert account;
// Database.insert(contact, false);
// //insert contact;
Opportunity opp = new Opportunity(Name = 'Testowy4001', StageName = 'Prospecting', CloseDate = Date.today().addDays(1));
Opportunity opp2 = new Opportunity(
    Name = 'Testowy4002',
    StageName = 'Prospecting',
    CloseDate = Date.today().addDays(1)
);
Opportunity opp3 = new Opportunity(
    Name = 'Testowy4003',
    StageName = 'Prospecting',
    CloseDate = Date.today().addDays(1)
);

insert opp;
insert opp2;
insert opp3;

System.debug('ID konta' + opp.Id);
System.debug('ID 2 konta' + opp2.Id);
// List<Id> listOfIds = new List<Id>();
// listOfIds.add(opp.Id);
// String oppId = '006090000023aReAAI';
// OpportunityDeletionAsync.deleteQuoteParentOpportunityAsync(oppId);
Quote quo = new Quote(Name = 'TestowyQuo101', OpportunityId = opp.Id);
Quote quo2 = new Quote(Name = 'TestowyQuo102', OpportunityId = opp2.Id);
Quote quo3 = new Quote(Name = 'TestowyQuo102', OpportunityId = opp3.Id);
List<Quote> quoList = new List<Quote>();
List<Quote> quoList2 = new List<Quote>();
quoList.add(quo);
quoList.add(quo2);
quoList.add(quo3);
quoList2.add(quo);
quoList2.add(quo2);
insert quoList;

//List<Opportunity> opp = [SELECT Id FROM Opportunity WHERE Id IN :listOfIds];
//System.debug(opp)
//List<Id> listOfIds = new List<Id>();
//listOfIds.add(quo.Id);

//System.debug('ID quo' + quo.Id);

delete quoList2;
