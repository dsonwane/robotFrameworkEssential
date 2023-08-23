*** Settings ***
Documentation    A while loop implementation
Library    OperatingSystem


*** Variables ***


*** Test Cases ***
Continue when iteration limit is reached
    WHILE    True    limit=5    on_limit=pass
        Log    Loop will be executed five times
    END
    Log    This will be executed normally.

Continue when time limit is reached
    WHILE    True    limit=10s    on_limit=pass
        Log    Loop will be executed for 10 seconds.
        Sleep   0.5s
    END
    Log    This will be executed normally

Nesting WHILE
    ${x} =   Set Variable    10
    WHILE    ${x} > 0
        ${y} =   Set Variable    ${x}
        WHILE    ${y} > 0
            ${y} =    Evaluate    ${y} - 1
        END
        IF    ${x} > 5
            ${x} =    Evaluate    ${x} - 1
        ELSE
            ${x} =    Evaluate    ${x} - 2
        END
    END

BREAK with FOR
    ${text} =    Set Variable    zero
    FOR    ${var}    IN    one    two    three
        IF    '${var}' == 'two'    BREAK
        ${text} =    Set Variable    ${text}-${var}
    END
    Should Be Equal    ${text}    zero-one

CONTINUE with FOR
    ${text} =    Set Variable    zero
    FOR    ${var}    IN    one    two    three
        IF    '${var}' == 'two'    CONTINUE
        ${text} =    Set Variable    ${text}-${var}
    END
    Should Be Equal    ${text}    zero-one-three