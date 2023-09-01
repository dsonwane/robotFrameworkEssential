from threading import current_thread
from robot.api.deco import keyword

__all__ = ['example_keyword']


def example_keyword():
    print('Running in thread "%s".' % current_thread().name)


def this_is_not_keyword():
    pass


ROBOT_AUTO_KEYWORDS = False


@keyword
def example_keyword():
    print('Running in thread "%s".' % current_thread().name)


def this_is_not_keyword1():
    pass

