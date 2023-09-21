*** Settings ***
Library    MyLibrary.py
Library    CustomName.py

*** Variables ***
${username}    Dipti
${password}    12345
*** Test Cases ***
My Test
    Do Nothing
    Hello    world
    Login Via User Panel    ${username}    ${password}