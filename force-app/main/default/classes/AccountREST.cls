@RestResource(urlMapping='/Account/*')
global with sharing class AccountREST {
    @HttpGet
    global static Account getName() {
        Id accountId = RestContext.request.params.get('accountId');
        AccountController controller = new AccountController();
        return controller.getAccountName(accountId);
        // List<Account> accList = [SELECT Name FROM Account];
        // return accList;
    }
}
