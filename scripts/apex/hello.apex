// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

Opportunity opp = new Opportunity(Name = 'Testowy6001', StageName = 'Prospecting', CloseDate = Date.today().addDays(1));
Opportunity opp2 = new Opportunity(
    Name = 'Testowy46002',
    StageName = 'Prospecting',
    CloseDate = Date.today().addDays(1)
);
Opportunity opp3 = new Opportunity(
    Name = 'Testowy6003',
    StageName = 'Prospecting',
    CloseDate = Date.today().addDays(1)
);

insert opp;
insert opp2;
insert opp3;

System.debug('ID konta' + opp.Id);
System.debug('ID 2 konta' + opp2.Id);
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

delete quoList2;
