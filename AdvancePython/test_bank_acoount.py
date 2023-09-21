import pytest
from bank_account import BankAccount, InsufficientAmount

@pytest.fixture
def empty_bank_account():
    """
    Returns a bank account with a balance of zero
    """
    return BankAccount()

@pytest.fixture
def non_empty_bank_account():
    """
       Returns a bank account with a balance of 100
       """
    return BankAccount(100)


def test_default_initial_amount(empty_bank_account):
    assert empty_bank_account.balance == 0


def test_setting_initial_amount(non_empty_bank_account):
    assert non_empty_bank_account.balance == 100


def test_add_money(non_empty_bank_account):
    non_empty_bank_account.deposit(100)
    assert non_empty_bank_account.balance == 200


def test_spend_cash(non_empty_bank_account):
    non_empty_bank_account.withdraw(50)
    assert non_empty_bank_account.balance == 50


def test_insufficient_amount_on_account(empty_bank_account):
    with pytest.raises(InsufficientAmount):
        empty_bank_account.withdraw(100)


@pytest.mark.parametrize("amount_to_deposit, amount_spent, expected", [(50,10,40), (100,70,30), (54, 4,50)])
def test_transactions(empty_bank_account, amount_to_deposit, amount_spent, expected):
    empty_bank_account.deposit(amount_to_deposit)
    empty_bank_account.withdraw(amount_spent)
    assert empty_bank_account.balance == expected



