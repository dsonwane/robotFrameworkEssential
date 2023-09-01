from robot.api import logger


def my_keyword(arg):
    logger.debug('Got argument %s' % arg)
    # do_something()
    logger.info('<i>This</i> is a boring example', html=True)
    logger.console('Hello, console!')


# Returning values
def return_string():
    return "Hello, world!"


def return_two_values():
    return 'first value', 'second value'


def return_multiple_values():
    return ['a', 'list', 'of', 'strings']