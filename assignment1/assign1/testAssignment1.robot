*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    DateTime
Library    String
Library    minList.py
Suite Setup       Open Browser    https://www.ixigo.com/    Chrome
Suite Teardown    Close Browser

*** Test Cases ***
Search inxigo
    Go To Homepage
    Enter Search Criteria
    Select Lowest Rate Departure Date and Select Return Date
    Select Traveler and Class
    Click Search Button
    Verify Search Criteria

*** Keywords ***
Go To Homepage
    Go To    https://www.ixigo.com/
    Maximize Browser Window
    Set Selenium Implicit Wait    10 seconds

Enter Search Criteria
    Input Text      css:input.c-input.u-v-align-middle    Pune
    Wait Until Element Is Visible    css:.autocompleter-results
    Click Element    xpath://div[contains(text(), 'PNQ - Pune, India')]

    Execute JavaScript    document.querySelector('input[placeholder="Enter city or airport"]').value = 'Bengaluru'
    Wait Until Element Is Visible    css:.autocompleter-results
    Click Element    xpath://div[contains(text(), 'BLR - Bengaluru, India')]

Select Lowest Rate Departure Date and Select Return Date
    Click Element       xpath://input[@placeholder='Depart']
    Wait Until Page Contains Element  //table[@class='rd-days']

    @{date_info_list} =  Create List
    FOR  ${index}  IN RANGE  1  7
        ${date_info} =  Get Text  xpath://td[contains(@class, 'rd-day-body low')][${index}]
        ${date} =  Get Substring  ${date_info}  0  2
        ${date_as_int} =  Convert To Integer  ${date}
        ${price} =  Get Substring    ${date_info}    2   10
        ${price_as_int} =  Convert To Integer  ${price}
        ${date_info_dic} =  Create Dictionary  day=${date_as_int}  info=${price_as_int}
        Append To List  ${date_info_list}  ${date_info_dic}
    END

    ${lowest} =    Find Min Info Date    ${date_info_list}

    Click Element   xpath://td[@class='rd-day-body low']//div[@class='day has-info'][normalize-space()='${lowest['day']}']
    ${result} =  Evaluate  ${lowest['day']} + 7
    Set Selenium Implicit Wait    10 seconds

    Click Element    //input[@placeholder='Return']
    Wait Until Element Is Visible  //div[@class='rd-container flight-ret-cal extra-bottom rd-container-attachment']
    Click Element    //div[@class='rd-container flight-ret-cal extra-bottom rd-container-attachment']/descendant::div[@class='day has-info'][normalize-space()='${result}']


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
#    Page Should Contain Element    xpath://input[@value='13 Sep, Tue']
#    Page Should Contain Element    xpath://input[@value='20 Sep, Tue']