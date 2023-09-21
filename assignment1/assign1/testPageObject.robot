*** Settings ***
Documentation   Perform End to End ixigo operations
Library     SeleniumLibrary
Library     Collections
Test Setup      open the browser with the url
Suite Setup
Suite Teardown
Test Teardown    Close Browser session
Resource        ../PO/PageObject.robot
Resource        ../PO/Generic.robot
Resource         ../PO/DatePage.robot

*** Test Cases ***
End to End Ixigo Operation
	PageObject.Enter Source
	PageObject.Enter Destination
    DatePage.Select Lowest Rate Departure Date and Select Return Date
	PageObject.Select Traveler and Class
	PageObject.Click Search Button
    PageObject.Verify Search Criteria
