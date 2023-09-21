*** Settings ***
Documentation    A file to select lowest departure date and return date
Library    SeleniumLibrary
Library    Collections
Library    DateTime
Library    String
Library    minList.py

*** Keywords ***
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

