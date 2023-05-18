*** Settings ***
Documentation       All the page objects and keywords of Checkout page
Library             SeleniumLibrary

*** Variables ***
${phone_name}       //h4[@class='media-heading']/a

*** Keywords ***
Verify itmes in the Checkout Page and proceed
    Page Should Contain         Blackberry
    Page Should Contain         Nokia Edge
    Click Element               //button[@class='btn btn-success']