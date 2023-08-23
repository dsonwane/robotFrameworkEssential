*** Settings ***
Documentation    For loops
Library    SeleniumLibrary

*** Variables ***
@{table}    Dipti   Nayna   Aaaman   Piyush
${var}      10
&{DICT}          a=1    b=2    c=3

*** Test Cases ***
Example
    FOR    ${animal}    IN    cat    dog
        Log    ${animal}
        Log    2nd keyword
    END
    Log    Outside loop

Second Example
    FOR    ${var}    IN    one    two    ${3}    four    ${5}
    ...    kuusi    7    eight    nine    ${10}
        Log    ${var}
    END
Nested For Loop
    Handle Table
    Handle List   ${table}
FOR-IN-RANGE loop
    #Only upper limit
    [Documentation]    Loops over values from 0 to 9.
    FOR    ${index}    IN RANGE    10
        Log    ${index}
    END

Start and end
    [Documentation]    Loops over values from 1 to 10.
    FOR    ${index}    IN RANGE    1    11
        Log    ${index}
    END

Arithmetic
    [Documentation]    Arithmetic with variable.
    FOR    ${index}    IN RANGE    ${var} + 1
        Log    ${index}
    END

Dictionary iteration with FOR loop
    FOR    ${key}    ${value}    IN    &{DICT}
        Log    Key is '${key}' and value is '${value}'.
    END

Dictionary iteration with FOR-IN-ENUMERATE loop
    FOR    ${index}    ${key}    ${value}    IN ENUMERATE    &{DICT}
        Log    On round ${index} key is '${key}' and value is '${value}'.
    END

Multiple dictionaries and extra items in 'key=value' syntax
    &{more} =    Create Dictionary    e=5    f=6
    FOR    ${key}    ${value}    IN    &{DICT}    d=4    &{more}    g=7
        Log    Key is '${key}' and value is '${value}'.
    END


*** Keywords ***
Handle Table
    FOR    ${row}    IN    10   20  30
        FOR    ${cell}    IN    ${row}
            Log    ${cell}
        END
    END

Handle List
        [Arguments]    @{table}
    FOR    ${row}    IN    @{table}
        FOR    ${cell}    IN    @{row}
            Log    ${cell}
        END
    END

