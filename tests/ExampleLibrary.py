__version__ = '0.1'


class ExampleLibrary:
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self):
        self._counter = 0

    def count(self):
        self._counter += 1
        print(self._counter)

    def clear_counter(self):
        self._counter = 0