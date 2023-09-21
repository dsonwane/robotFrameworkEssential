*** Settings ***
Library    dynamicLib.py

*** Test Cases ***
Use Dynamic Library
    ${result1}    Keyword 1    Hello    World
    ${result2}    Keyword 2    robot
    Log    Result from Keyword 1: ${result1}
    Log    Result from Keyword 2: ${result2}