*** Settings ***
Library    VariableNumberArg.py

*** Test Cases ***
Varargs
    Any Arguments
    Any Arguments    argument
    Any Arguments    arg 1    arg 2    arg 3    arg 4    arg 5
    One Required     required arg
    One Required     required arg    another arg    yet another
    Also Defaults    required
    Also Defaults    required    these two    have defaults
    Also Defaults    1    2    3    4    5    6

Keyword Arguments
    Example Keyword    hello=world        # Logs 'hello world'.
    Example Keyword    foo=1    bar=42    # Logs 'foo 1' and 'bar 42'.


Positional
    Various Args    hello    world                # Logs 'arg: hello' and 'vararg: world'.

Named
    Various Args    arg=value                     # Logs 'arg: value'.

Kwargs
    Various Args    a=1    b=2    c=3             # Logs 'kwarg: a 1', 'kwarg: b 2' and 'kwarg: c 3'.
    Various Args    c=3    a=1    b=2             # Same as above. Order does not matter.

Positional and kwargs
    Various Args    1    2    kw=3                # Logs 'arg: 1', 'vararg: 2' and 'kwarg: kw 3'.

Named and kwargs
    Various Args    arg=value      hello=world    # Logs 'arg: value' and 'kwarg: hello world'.
    Various Args    hello=world    arg=value      # Same as above. Order does not matter.

Keyword only arguments
    Sort Words    Foo    bar    baZ
    Sort Words    Foo    bar    baZ    case_sensitive=True
#    Strip Spaces    ${word}    left=False

Positional-only arguments
    # Positional-only and normal argument used as positional arguments.
    Keyword    foo    bar
    # Normal argument can also be named.
    Keyword    foo    normal=bar
    # Positional-only argument gets literal value `posonly=foo` in this case.
    Keyword    position=foo    normal=bar
    # This fails.
    Keyword    normal=bar    position=foo

Manual argument conversion
    Example Keyword1    42      False

Specifying argument types using @keyword decorator
    Example Keyword2    50
    Example Keyword3    100

Implicit argument types based on default values
    Example Keyword4

Specifying multiple possible types
    Example Keyword5    20

Conversion
    Example Keyword5    10        # Argument is a string. Converted to an integer.
    Example Keyword5     1.5       # Argument is a string. Converted to a float.
    Example Keyword5    ${10}     # Argument is an integer. Accepted as-is.
    Example Keyword5    ${1.5}    # Argument is a float. Accepted as-is.
    Example Keyword5     1    big        # Argument is a string. Accepted as-is.
    Example Keyword5     1    10         # Argument is a string. Accepted as-is.
    Example Keyword5     1    ${10}      # Argument is an integer. Accepted as-is.
    Example Keyword5     1    ${None}    # Argument is `None`. Accepted as-is.
    Example Keyword5     1    ${1.5}     # Argument is a float. Converted to an integer.

Custom argument converters
    Keyword3        25.1.2022

Embedding arguments into keyword names
    Add 7 copies of coffee to cart

#Asynchronous keywords
#    Examples

Timestamp
    Example Keyword6

Console
    My Keyword    hello
    My Keyword1    Hello
    Log To Console    Good morning
    Log To Console And Log File    Good Morning

Logging example
    Logging Example
