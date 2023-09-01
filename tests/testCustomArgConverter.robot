*** Settings ***
Documentation    custom argument converter
Library    CustomArgConverter.py


*** Test Cases ***
Example
#    finnish     25.1.2022
#    Us              1/25/2022
#    ISO 8601    2022-01-22
    Keyword    25.1.2022