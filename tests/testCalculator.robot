*** Settings ***
Library           Remote  http://localhost:8080
Library    MyListener.py

*** Test Cases ***
Addition Test
    ${result} =     Call Method     add     5     3
    Should Be Equal As Integers     ${result}    8

Subtraction Test
    ${result} =     Call Method     subtract     10     3
    Should Be Equal As Integers     ${result}    ${7}
