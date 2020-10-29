@RestResource(urlMapping='/Account/*')
global with sharing class AccountREST {
  @HttpGet
  global static Account getName() {
    Id accountId = RestContext.request.params.get('accountId');
    AccountController controller = new AccountController();
    return controller.getAccountName(accountId);
  }

  // @HttpGet
  // global static List<Account> getName(){
  //     //Id accountId = RestContext.request.params.get('accountId');
  //     AccountController controller = new AccountController();
  //     return controller.getAccounts();
  // }

  //     @HttpPost
  //     global static String createAccount(String name){
  //         AccountController accountToCreate = new AccountController();
  //         accountToCreate.name = name;
  //         insert accountToCreate;
  //         return accountToCreate.Id;
  //     }
  // }
}
