*** Settings ***
Documentation  A resource file containing the application specific keywords
Library		Selenium2Library
Test Setup       Open Browser  ${testUrl}  chrome
Test Teardown    Close Browser

*** Variables ***
${testUrl}            https://sha-test-app.herokuapp.com/
${testButton}         //button[contains(@class,'default-btn')]
${generateBtn}        markup-generation-button

*** Test Cases ***
Example test case
	Click Element    ${testButton}
	Confirm Action
	Click Element    ${generateBtn}
#	Click Element    ${testButton}   # needs heal
#	Confirm Action