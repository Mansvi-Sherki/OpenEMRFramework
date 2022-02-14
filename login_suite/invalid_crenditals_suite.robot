*** Settings ***
Documentation   This suite file verifies all test cases related to Invalid credentials
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../base/common_functionality.resource

Test Setup      Launch Browser
Test Teardown   End Browser

Test Template       Verify Invalid Credentials Template

*** Test Cases ***
TC1     john   john123    Dutch    Invalid username or password
TC2     peter   peter123   Danish    Invalid username or password
TC3     Mark    ${EMPTY}     Greek   Invalid username or password
TC3     ${EMPTY}    Mark123     Greek   Invalid username or password

*** Keywords ***
Verify Invalid Credentials Template
     [Arguments]     ${username}     ${password}     ${language}     ${expected_title}
     Input Text    id=authUser   ${username}
     Input Password    id=clearPass    ${password}
     Select From List By Label    name=languageChoice     ${language}
     Click Element    xpath=//button[@type='submit']
     Element Should Contain    xpath=//div[contains(text(),'Invalid')]    ${expected_title}