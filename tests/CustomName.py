from robot.api.deco import keyword


@keyword('Login via user panel')
def login(username, password):
    print(username)
    print(password)
