*** Settings ***
Documentation    First line.\n\nSecond paragraph. This time\nwith multiple lines.
Metadata         Example list    - first item\n- second item\n- third
#Documentation
#...    First line.
#...
#...    Second paragraph. This time
#...    with multiple lines.
#Metadata
#...    Example list
#...    - first item
#...    - second item
#...    - third

*** Variables ***
${var}      *this is bold*
${x}        10
${VAR}           123
${rc}       10
${status}   pass
*** Test Cases ***
Ends with newline
    [Documentation]    Ends with a newline and\n
    ...                automatic newline is not added.

Ends with backslash
    [Documentation]    Ends with a backslash and \
    ...                no newline is added.


#    Spaces
Long list item
    [Documentation]
    ...    List:
    ...    - Short item.
    ...    - Second item is pretty long and it is split to
    ...      multiple rows. Leading spaces are preserved.
    ...    - Another short item.

Preformatted text
    [Documentation]
    ...    Example with consecutive internal spaces:
    ...
    ...    | *** Test Cases ***
    ...    | Example
    ...    |     Keyword

Inline styles
    Log    ${var}
    Custom Message    _Test execution completed._
IF/ELSE
    IF    ${x} > 0
        Log to console   ${x} is positive
    ELSE
        Log to console   ${x} is negative
    END

Inline Python evaluation
    Log to console    ${x} is ${{'positive' if ${x} > 0 else 'negative'}}

Evaluate keyword
    ${type} =    Evaluate    'positive' if ${x} > 0 else 'negative'
    Log to console    ${x} is ${type}

Should Be True keyword
    Should Be True    ${x} > 0

Python syntax
    Should Be True       ${{'${VAR}' == '123'}}
    Should Be True       ${{'${VAR}'.startswith('x') or '${VAR}' in '012345'}}

Python builtins
    Should Be Equal      ${{len('${VAR}')}}        ${3}
    Should Be Equal      ${{int('${VAR}')}}        ${123}

Access modules
    Should Be Equal      ${{os.sep}}               ${/}
    Should Be Equal      ${{round(math.pi, 2)}}    ${3.14}
    Should Start With    ${{robot.__version__}}    4.

Does not work due to nested module structure
    Log    ${{selenium.webdriver.ChromeOptions()}}

Evaluate keyword with nested module
    ${options} =    Evaluate    selenium.webdriver.ChromeOptions()    modules=selenium.webdriver
    Log    ${options}

Does not work due to list comprehension
    Log    ${{[json.loads(item) for item in ('1', '"b"')]}}

Evaluate keyword with list comprehension
    ${items} =    Evaluate    [json.loads(item) for item in ('1', '"b"')]    modules=json
    Log    ${items}

Using normal variable syntax
    Should Be True    ${rc} > 0
    IF    '${status}'.upper() == 'PASS'
        Log    Passed
    END

*** Keywords ***
Custom Message
    [Arguments]    ${message}
    Log    ${message}
True examples
    Should Be Equal    ${x}    ${y}    Custom error    values=True         # Strings are generally true.
    Should Be Equal    ${x}    ${y}    Custom error    values=yes          # Same as the above.
    Should Be Equal    ${x}    ${y}    Custom error    values=${TRUE}      # Python `True` is true.
    Should Be Equal    ${x}    ${y}    Custom error    values=${42}        # Numbers other than 0 are true.

False examples
    Should Be Equal    ${x}    ${y}    Custom error    values=False        # String `false` is false.
    Should Be Equal    ${x}    ${y}    Custom error    values=no           # Also string `no` is false.
    Should Be Equal    ${x}    ${y}    Custom error    values=${EMPTY}     # Empty string is false.
    Should Be Equal    ${x}    ${y}    Custom error    values=${FALSE}     # Python `False` is false.
    Should Be Equal    ${x}    ${y}    Custom error    values=no values    # Special false string with this keyword.