*** Settings ***
Documentation    logging examples
Library    logging.py
Library    documentationLib.py

*** Test Cases ***
Public logging API
    My Keyword    Hello
Returning one value
    ${string} =    Return String
    Should Be Equal    ${string}    Hello, world!

Returning multiple values
    ${var1}    ${var2} =    Return Two Values
    Should Be Equal    ${var1}    first value
    Should Be Equal    ${var2}    second value

