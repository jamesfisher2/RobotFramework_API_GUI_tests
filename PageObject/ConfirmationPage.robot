*** Settings ***
Documentation       All the page objects and keywords of Confirmation page
Library             SeleniumLibrary
Resource            Generic.robot

*** Variables ***

*** Keywords ***
Enter the Country and select the terms
    [arguments]     ${country_name}
    Input Text      country         ${country_name}
    Sleep           3
    Generic wait until element passed is located on Page    //a[text()='${country_name}']
    Click Element           //a[text()='${country_name}']
    Click Element           //label[@for='checkbox2']

ConfirmationPage.Purchuse the Product and Confirm the Purchase
    Click Button            //input[@value='Purchase']
    Page Should Contain     Success! Thank you! Your order will be delivered in next few weeks :-).

