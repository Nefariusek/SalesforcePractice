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
//Account account = new Account(Name = 'Konto Gdońsk', BillingCity = 'Gdońsk');
Contact contact = new Contact(LastName = 'TestTest Trigger', AccountId='00109000002J0kxAAC', MailingCity ='Gdaaaeńsk');
//insert account;
insert contact;
