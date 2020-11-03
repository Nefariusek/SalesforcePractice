public with sharing class AccountController {
    public AccountController() {
    }

    public List<Account> getAccounts() {
        return [SELECT Id, Name FROM Account];
    }

    public Account getAccountName(Id accountId) {
        return [SELECT Name FROM Account WHERE Id = :accountId];
    }
}
