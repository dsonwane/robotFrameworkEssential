*** Settings ***
Documentation    Execution Flow

*** Test Cases ***
Skip on failure Example
    [Tags]    robot:skip-on-failure
    Fail      this test will be marked as skipped instead of failed

Skip Example
    [Tags]    robot:skip
    Log       This is not executed

Test 1
    Run Keyword and Continue on Failure    Should be Equal    1    2
    User Keyword 1

Test 2
    [Tags]    robot:continue-on-failure
    Should be Equal    1    2
    User Keyword 2

loop Example
    [Tags]    robot:continue-on-failure
    FOR    ${index}    IN RANGE    10
        Do Something
    END

recursive-continue-on-failure Example
    [Tags]    robot:recursive-continue-on-failure
    Should be Equal    1    2
    User Keyword 3
    Log    This is executed

Disable continue-in-failure with templates
    [Tags]    robot:stop-on-failure
    [Template]    Should be Equal
    this    fails
    this    is not run

*** Keywords ***
User Keyword 1
    Run Keyword and Continue on Failure    Should be Equal    3    4
    Log    This is executed

User Keyword 2
    [Tags]    robot:continue-on-failure
    Should be Equal    3    4
    Log    This is executed

User Keyword 3
    Should be Equal    3    4
    User Keyword 4
    Log    This is executed

User Keyword 4
    Should be Equal    5    6
    Log    This is executed
