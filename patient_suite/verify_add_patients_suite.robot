*** Comments ***
Navigate onto https://demo.openemr.io/b/openemr/interface/login/login.php?site=default
Update username as admin
Update password as pass
Click on the login button
Click on Patient/Client and Click on Patients
Click Add New Patient
Add the first name, last name
Update DOB as today's date
Update the Sex
Click on the create new patient button above the form
Click on confirm create new patient button.
Print the text from alert box (if any error before handling alert add 5 sec wait)
Handle alert
Close the Happy Birthday popup
Get the added patient name and print in the console.

*** Settings ***
Documentation   This suite file verifies all test cases related to valid credentials
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../base/common_functionality.resource

Test Setup      Launch Browser
#Test Teardown   End Browser

Test Template       Verify add patients Template

*** Test Cases ***
TC1     admin   pass    English (Indian)

*** Keywords ***
Verify add patients Template
    [Arguments]     ${username}     ${password}     ${language}
     Input Text    id=authUser   ${username}
     Input Password    id=clearPass    ${password}
     Select From List By Label    name=languageChoice     ${language}
     Click Element    xpath=//button[@type='submit']

     Click Element    xpath=//div[text()='Patient/Client']
     Click Element    xpath=//div[text()='Patients']
     Click Element    xpath=//button[text()='Add New Patient']
     Input Text    xpath=//input[@id='form_fname']    puni
     Input Text    xpath=//input[@id='form_lname']    raj
     Click Element    xpath=//input[@id='form_DOB']
     Click Element    xpath=//div[text()='11']

     #Mouse Down    id=form_sex
     Select From List By Label    id=form_sex       Female
     Click Element    id=create
     Sleep    5s
     ${alert_text}  Handle Alert   action=ACCEPT   timeout=10s