from threading import current_thread

from robot.api.deco import not_keyword


not_keyword(current_thread)    # Don't expose `current_thread` as a keyword.


def example_keyword():
    print('Running in thread "%s".' % current_thread().name)


@not_keyword
def this_is_not_keyword():
    pass