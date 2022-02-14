*** Settings ***
Documentation   This file contains reusable keywords

Library     SeleniumLibrary
Library     OperatingSystem

*** Variables ***
${BROWSER_NAME}     chrome
${URL}      https://demo.openemr.io/b/openemr/index.php


*** Keywords ***
Launch Browser

    Set Local Variable    ${driver}        chromedriver

    IF    '${BROWSER_NAME}' == 'firefox'
        Set Local Variable    ${driver}        geckodriver.exe
    ELSE IF  '${BROWSER_NAME}' == 'edge'
        Set Local Variable    ${driver}        msedgedriver.exe
    ELSE IF  '${BROWSER_NAME}' == 'safari'
        Set Local Variable    ${driver}        safaridriver.exe
    END
     Append To Environment Variable    path      ${EXECDIR}\\drivers
     Open Browser  url=${URL}     browser=${BROWSER_NAME}
     Maximize Browser Window
     Set Selenium Implicit Wait    30s
     Set Screenshot Directory    ${EXECDIR}${/}screenshot

End Browser
    Capture Page Screenshot
    Close Browser