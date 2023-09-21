*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Enter Source
    Input Text      css:input.c-input.u-v-align-middle    Pune
    Wait Until Element Is Visible    css:.autocompleter-results
    Click Element    xpath://div[contains(text(), 'PNQ - Pune, India')]

Enter Destination
	Execute JavaScript    document.querySelector('input[placeholder="Enter city or airport"]').value = 'Bengaluru'
    Wait Until Element Is Visible    css:.autocompleter-results
    Click Element    xpath://div[contains(text(), 'BLR - Bengaluru, India')]

Select Traveler and Class
    Click Element       id=passenger-list
    Click Element       css:div[class='passanger-class-input u-pos-rel'] div:nth-child(1) div:nth-child(2) span:nth-child(4)
    Click Element       css=div[class='u-box-result'] div:nth-child(2) div:nth-child(2) span:nth-child(3)
    Click Element       css=div[class='banner'] div:nth-child(3) div:nth-child(2) span:nth-child(2)

Click Search Button
    Click Element       css:div[class='search u-ib u-v-align-bottom'] div:nth-child(1)
    Wait Until Element Is Visible    css:div[class='result-col outr'] div[class='c-flight-listing-split-row selected hide-detail'] img   timeout=10s

Verify Search Criteria
    Page Should Contain Element    xpath://input[@value='PNQ - Pune']
    Page Should Contain Element    xpath://input[@value='BLR - Bengaluru']
    Page Should Contain Element    xpath://input[@value='7 Passengers, Economy']