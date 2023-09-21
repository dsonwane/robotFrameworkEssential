*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    DateTime
Library    String
Suite Setup       Open Browser    https://www.ixigo.com/    Chrome
Suite Teardown    Close Browser

*** Test Cases ***
Search inxigo
    Go To Homepage
    Enter Search Criteria
    Select Lowest Rate Departure Date and Select Return Date
#    Select Traveler and Class
#    Click Search Button
#    Verify Search Criteria

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
#    ${date_element} =    Get Element Attribute    xpath://td[contains(@class, 'rd-day-body low')]    data-date
#    ${date_info} =  Get Text  xpath://td[contains(@class, 'rd-day-body low')]
#    Click Element   xpath://td[contains(@class, 'rd-day-body low')][1]
#
#    ${numeric_part} =  Get Substring  ${date_info}  0  2
#    ${numeric_part_as_integer} =  Convert To Integer  ${numeric_part}
#    ${result} =  Evaluate  ${numeric_part_as_integer} + 7
#    Log To Console    ${result}

#    ${departure_dates} =    Get Text      xpath://td[contains(@class, 'rd-day-body low')]
#    ${departure_rates} =    Get Element Attribute     //div[@class='info']
#
#
#    Log To Console       ${departure_dates}
#    Log To Console       ${departure_rates}
#
#    ${departure_data}    Create List
#    FOR    ${i}   IN   ${departure_dates}
#        ${date}    Get Text    ${departure_dates}[1]
#        ${rate}    Get Text    ${departure_rates}[${i}]
#       Append To List    ${departure_data}    (${date}, ${rate})
#    END
#
#    # Step 5: Sort the list by rates
#    ${sorted_departure_data}    Sort List    ${departure_data}    key=lambda x: x[1]
#
#    # Step 6: Get the first departure date with the lowest rate
#    ${lowest_rate_date}    Set Variable    ${sorted_departure_data[0][0]}
#
#    Log To Console   ${lowest_rate_date}
#    # Step 7: Click on the lowest rate departure date
##    Click Element    xpath://div[contains(text(), '${lowest_rate_date}')]
#
#    # Step 8: Calculate the return date as 7 days from departure date
#    ${departure_date_obj}    Convert Date    ${lowest_rate_date}    result_format=%d %B %Y
#    ${return_date_obj}       Add Time To Date    ${departure_date_obj}    7 days
#    ${return_date}           Convert Date        ${return_date_obj}    result_format=%d %B %Y
#
#    # Step 9: Log the selected dates
#    Log    Lowest Rate Departure Date: ${lowest_rate_date}
#    Log    Return Date: ${return_date}

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

    ${lowest_price} =    Get From Dictionary    ${date_info_dic}    info
    ${lowest_date} =     Get From Dictionary    ${date_info_dic}    day

    Log    ${lowest_price}
    Log    ${lowest_date}

     ${result} =  Evaluate  ${lowest_date} + 7

    Click Element   xpath://div[@class='day has-info'][normalize-space()='${lowest_date}']







#    ${parsed_date} =    Evaluate    datetime.datetime.strptime($date_element, '%d%m%Y') + datetime.timedelta(days=7)
#    ${formatted_date} =    Evaluate    $parsed_date.strftime('%d%m%Y')
#    Log    New Date: ${formatted_date}
#
#    Click Element    //input[@placeholder='Return']
#    Wait Until Element Is Visible  //div[@class='rd-container flight-ret-cal extra-bottom rd-container-attachment']
##    Wait Until Element Is Visible    //td[@class='rd-day-body low']
##    Click Element    //td[@class='rd-day-body low' and @data-date='${formatted_date}']
##    Click Element    xpath=//td[@data-date="20092023"]
#    Click Element    //div[@class='rd-container flight-ret-cal extra-bottom rd-container-attachment']/descendant::div[@class='day has-info'][normalize-space()='${result}']


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

