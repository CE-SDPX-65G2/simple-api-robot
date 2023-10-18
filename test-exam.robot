*** Settings ***
Library           RequestsLibrary


*** Keywords ***

Get Calculation JSON
    [Arguments]    ${num1}
    ${resp}=     GET    http://127.0.0.1:5000/mul5/${num1}

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    [return]    ${resp.json()}


*** Test Cases ***
Test Multiple Numbers 0 * 5 = 0

    ${json_resp}=    Get Calculation JSON    ${0}

    #Verify Result is 0 (as a float)
    Should Be Equal As Numbers    ${json_resp}    0.0

Test Multiple Numbers 3 * 5 = 15

    ${json_resp}=    Get Calculation JSON    ${3}

    #Verify Result is 15 (as a float)
    Should Be Equal As Numbers    ${json_resp}    15.0

Test Multiple Numbers 1.5 * 5 = 1.5

    ${json_resp}=    Get Calculation JSON    1.5

    #Verify Result is 7.5 (as a float)
    Should Be Equal As Numbers    ${json_resp}    7.5



