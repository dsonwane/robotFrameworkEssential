from robot.api.deco import keyword


@keyword(tags=['tag1', 'tag2'])
def login(username, password):
    print(username)


@keyword('Custom name', ['tags', 'here'])
def another_example():
    print("----")


def login1(username, password):
    """Log user in to SUT.

     Tags: tag1, tag2
        """
    print(username)