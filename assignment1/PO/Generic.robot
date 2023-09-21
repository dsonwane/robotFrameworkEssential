*** Settings ***
Documentation     A resource file with reusable keywords and variables.
Library           SeleniumLibrary

*** Variables ***
${url}                   https://www.ixigo.com/
${browser_name}          Chrome

*** Keywords ***
open the browser with the url
    Create Webdriver    ${browser_name}
    Go To   ${url}
    Maximize Browser Window
    Set Selenium Implicit Wait    10 seconds

Close Browser session
    Close Browser






