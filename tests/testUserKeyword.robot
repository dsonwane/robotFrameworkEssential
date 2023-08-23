*** Settings ***
Documentation    User Keywords
Library    SeleniumLibrary

*** Variables ***
${expected}     Google
${VARIABLE}     Hello

*** Test Cases ***
Validate successful login
    Open Login Page
    Title Should Start With     ${expected}
Arguements
    One Argument    10
    Three Arguments     10  20  30
    One Argument With Default Value
    Two Arguments With Defaults
    One Required And One With Default   HiRequired
    Default Based On Earlier Argument   10


*** Keywords ***
Open Login Page
    Create Webdriver    Chrome
    Go To         https://www.google.com/
    Title Should Be    Google

Title Should Start With
    [Arguments]    ${expected}
    ${title} =    Get Title
    Should Start With    ${title}    ${expected}

One Argument
    [Arguments]    ${arg_name}
    Log    Got argument ${arg_name}

Three Arguments
    [Arguments]    ${arg1}    ${arg2}    ${arg3}
    Log    1st argument: ${arg1}
    Log    2nd argument: ${arg2}
    Log    3rd argument: ${arg3}

One Argument With Default Value
    [Arguments]    ${arg}=default value
    [Documentation]    This keyword takes 0-1 arguments
    Log    Got argument ${arg}
Two Arguments With Defaults
    [Arguments]    ${arg1}=default 1    ${arg2}=${VARIABLE}
    [Documentation]    This keyword takes 0-2 arguments
    Log    1st argument ${arg1}
    Log    2nd argument ${arg2}

One Required And One With Default
    [Arguments]    ${required}    ${optional}=default
    [Documentation]    This keyword takes 1-2 arguments
    Log    Required: ${required}
    Log    Optional: ${optional}

Default Based On Earlier Argument
    [Arguments]    ${a}    ${b}=${a}    ${c}=${a} and ${b}
    Should Be Equal    ${a}    ${b}
    Should Be Equal    ${c}    ${a} and ${b}

