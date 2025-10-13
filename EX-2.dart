class BankAccount {
  final int _accountId;
  final String _accountOwner;
  double _currentBalance;

  BankAccount(this._accountId, this._accountOwner, [this._currentBalance = 0.0]);

  int get accountId => _accountId;
  String get accountOwner => _accountOwner;
  double get balance => _currentBalance;

  void withdraw(double amount) {
    if(amount > _currentBalance) {
      throw Exception("Insufficient balance for withdrawal!");
    }

    if(amount <= 0) {
      throw Exception("Withdraw amount must be positive");
    }
    _currentBalance -= amount;
  }

  void credit(double amount) {
    if(amount <= 0) {
      throw Exception("Deposit amount must be positive");
    }
    _currentBalance += amount;
  }
}

class Bank {
  final List<BankAccount> _accounts = [];
  final String name;

  Bank({required this.name});

  BankAccount createAccount(int accountId, String accountOwner) {
    for(var acc in _accounts) {
      if(acc.accountId == accountId) {
        throw Exception("Account with ID $accountId already exists!");
      }
    }
    var account = BankAccount(accountId, accountOwner);
    _accounts.add(account);
    return account;
  }
}
 
void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
