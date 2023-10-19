*** Settings ***
Library           RequestsLibrary


*** Keywords ***


Get Calculation JSON
    [Arguments]    ${num1}
    ${resp}=     GET    http://127.0.0.1:5000/isneg/${num1}
    
    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}
    
    [Return]    ${resp.content}



*** Test Cases ***
Test Numbers 0

    #Verify Result is 0
    ${json_resp}=    Get Calculation JSON    ${0}
    Should Be Equal As Strings    ${json_resp}    False

Test Numbers 3

    #Verify Result is 3
    ${json_resp}=    Get Calculation JSON    ${3}
    Should Be Equal As Strings    ${json_resp}    False

Test Numbers -5

    #Verify Result is 3
    ${json_resp}=    Get Calculation JSON    ${-5}
    Should Be Equal As Strings    ${json_resp}    True


