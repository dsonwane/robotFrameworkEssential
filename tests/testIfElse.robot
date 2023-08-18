*** Settings ***
Documentation    If else implementation

*** Variables ***
${rc}   0

*** Test Cases ***
If
     IF    ${rc} > 0
       Log    rc greater than zero
     END
#     log      rc less than zero
If Else
    IF    ${rc} > 0
        Log     rc greater than zero
    ELSE
        Log     rc less than zero
    END

Else if
    IF    ${rc} > 0
        Log     rc greater than zero
    ELSE IF    ${rc} < 0
        Log     rc less than zero
    ELSE IF    ${rc} == 0
        Log     rc is equal to zero
    ELSE
        Log     default
    END