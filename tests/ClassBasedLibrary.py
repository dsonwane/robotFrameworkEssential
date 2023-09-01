from robot.api.deco import keyword, library


@library
class Example:

    @keyword
    def this_is_keyword(self):
        pass

    @keyword('This is keyword with custom name')
    def xxx(self):
        pass

    def this_is_not_keyword(self):
        pass