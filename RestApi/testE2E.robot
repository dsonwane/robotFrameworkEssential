*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***

${url}      https://thetestingworldapi.com
${original_first_name}  Priya
${update_first_name}    Bhavna

*** Test Cases ***
End to end scenario
    Create Session    addData   ${url}
	&{body}=    Create Dictionary    first_name=${original_first_name}  middle_name=D    last_name=Sonwane  date_of_birth=26/01/1998
	&{header}=      Create Dictionary    Content-Type=application/json
	${response}=    Post Request    addData     api/studentsDetails     data=${body}    headers=&{header}
    Log To Console    ${response.content}
    ${json_response}=   To Json     ${response.content}
    @{id_list}=     Get Value From Json    ${json_response}     id
    ${id}=      Get From List    ${id_list}     0

    Log To Console    ${id}

	&{body1}=    Create Dictionary   id=${id}      first_name=${update_first_name}  middle_name=D    last_name=Sonwane  date_of_birth=26/01/1998
	${put_response}=    Put Request      addData      /api/studentsDetails/${id}    data=${body1}    headers=${header}
	Log To Console    ${put_response.status_code}
	Log To Console    ${put_response.content}
    ${getData}=     Get Request    addData    api/studentsDetails/${id}
    Log To Console    ${getData.content}
    ${get_json}=    To Json    ${getData.content}
    @{Lfirst_name}=     Get Value From Json     ${get_json}     data.first_name
    ${first_name}=      Get From List     ${Lfirst_name}    0
    Should Be Equal    ${first_name}        ${update_first_name}

    ${delete_response}     Delete Request    addData    /api/studentsDetails/${id}
    ${delete_json}=     To Json    ${delete_response.content}
    @{message}=     Get Value From Json    ${delete_json}       status
    ${status_msg}=      Get From List    ${message}     0
    Should Be Equal    ${status_msg}    true


