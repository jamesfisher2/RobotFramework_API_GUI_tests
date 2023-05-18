*** Settings ***
Documentation    A resource file with resuable keywords and variables.
...
...              Tye system specific keywords created here from our own
...              domain specific language. They utizlie keywords provided
...              by the imported SeleniumLibrary
Library    SeleniumLibrary

*** Variables ***
${user_name}            rahulshettyacademy
${invalid_password}     123456
${valid_password}       learning
${url}                  https://rahulshettyacademy.com/loginpagePractise/
${browser_name}         Chrome

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome  executable_path=../resources
    Go To    ${url}
    Maximize Browser Window

open the browser with the url
    #[arguments]         ${browser_name}    # uncomment if you want to steer on TC level
    Create Webdriver    ${browser_name}  executable_path=../resources/${browser_name}
    Go To    ${url}
    Maximize Browser Window

Close Browser session
    Close Browser

Generic wait until element passed is located on Page
    [arguments]     ${page_locator}
    Wait Until Element Is Visible       ${page_locator}