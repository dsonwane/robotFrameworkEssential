*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${base_URL}     https://httpbin.org/
${url}      https://thetestingworldapi.com
*** Test Cases ***
#fetch data from https://httpbin.org/get
#	Create Session    mydata    ${base_URL}
#	${response}=    Get Request     mydata     get
#	Log To Console    ${response.status_code}
#	Log To Console      ${response.content}
#	Log To Console    ${response.headers}
#
#	#Validations
#	${status_code}=     Convert To String       ${response.status_code}
#	Log     ${status_code}
##	Should Be Equal    ${status_code}   200
#	Should Be Equal    ${status_code}   200

add new data
	Create Session    addData   ${url}
	&{body}=    Create Dictionary    first_name=Aaman  middle_name=gulab    last_name=Phale  date_of_birth=26/01/1998
	&{header}=      Create Dictionary    Content-Type=application/json
	${response}=    Post Request    addData     api/studentsDetails     data=${body}    headers=${header}
	Log To Console    ${response.status_code}.
    Log To Console    ${response.content}
    ${status}=      Convert To String    ${response.status_code}.
    Should Be Equal     ${status}   201.

update data by id
	Create Session    updateData    ${url}
	&{body}=    Create Dictionary   id=7795829      first_name=Dipti  middle_name=D    last_name=Sonwane  date_of_birth=26/01/1998
    &{header}=      Create Dictionary    Content-Type=application/json
	${response}=    Put Request      updateData      /api/studentsDetails/7795829   data=${body}    headers=${header}
	Log To Console    ${response.status_code}
	Log To Console    ${response.content}
    ${getData}=     Get Request    updateData    api/studentsDetails/7795829
    Log To Console    ${getData.content}
#
#
#
delete data
	Create Session    deleteById    ${url}
	${response}     Delete Request    deleteById    /api/studentsDetails/7795839
    ${status_code}=     Convert To String       ${response.status_code}
	Log     ${status_code}
	Should Be Equal    ${status_code}   200
	${json_response}    To Json    ${response.content}
	${status_list}=       Get Value From Json    ${json_response}   status
	${status}=      get from list   ${status_list}  0
    Should Be Equal    ${status}    true
    Log To Console    ${response.status_code}
	Log To Console      ${response.content}