*** Settings ***
Variables    PythonVariables.py
Variables    DynamicVariables.py

*** Test Cases ***
Access Python Variables
    Log   ${TestEnv.ip}
    Log    ${TestEnv.roles}
    Log Many   @{TestEnv.roles}
    Log    ${my_var}
    Log Many   @{my_list}
    Log Many   &{my_dict}
    FOR    ${item}    IN    @{my_list}
        Log    ${item}
    END

Access Dynamic Variables
    Log   ${USER}
    Log   ${RANDOM_INT}
    Log   ${CURRENT_TIME}
    Log   ${AFTERNOON}
    Log   ${AREA1}
    Log   ${AREA2}