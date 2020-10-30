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
String accId = '00109000002J0lbAAC';
Contact contact =// new Contact[] {
    new Contact(LastName = 'Wchodzi1', AccountId=accId, MailingCity ='Szczecin');
    //new Contact(LastName = 'Wchodzi2', AccountId=accId, MailingCity ='Bytgoszcz');
   // new Contact(LastName = 'Nie wchodzi1', AccountId=accId, MailingCity ='Gdaaaeńsk'),
   // new Contact(LastName = 'Wchodzi3', AccountId=accId, MailingCity ='Lublin'),
   // new Contact(LastName = 'Nie wchodzi2', AccountId=accId, MailingCity ='Wieluń')

//insert account;
insert contact;
