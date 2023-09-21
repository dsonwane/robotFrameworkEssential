class InsufficientAmount(Exception):
    pass

class BankAccount:
    def __init__(self, initial_amount=0):
        self.balance=initial_amount

    def withdraw(self, amount):
        if self.balance<amount:
            raise InsufficientAmount
        self.balance -= amount

    def deposit(self, amount):
        self.balance += amount
