def no_arguments():
    print("Keyword got no arguments.")


def one_argument(arg):
    print("Keyword got one argument '%s'." % arg)


def three_arguments(a1, a2, a3):
    print("Keyword got three arguments '%s', '%s' and '%s'." % (a1, a2, a3))


def one_default(arg='default'):
    print("Argument has value %s" % arg)


def multiple_defaults(arg1, arg2='default 1', arg3='default 2'):
    print("Got arguments %s, %s and %s" % (arg1, arg2, arg3))