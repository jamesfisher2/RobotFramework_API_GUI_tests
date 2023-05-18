*** Settings ***
Documentation       To validate the Login form
Library             SeleniumLibrary
Library             Collections
Library             ../customLibraries/Shop.py
Test Setup          open the browser with the url
Test Teardown       Close Browser session
Resource            ../PageObject/Generic.robot
Resource            ../PageObject/LandingPage.robot
Resource            ../PageObject/ShopPage.robot
Resource            ../PageObject/CheckoutPage.robot
Resource            ../PageObject/ConfirmationPage.robot

*** Variables ***
@{listOfProducts}       Blackberry      Nokia Edge
${country_name}         Poland

*** Test Cases ***
Validate UnSuccessful Login
    [Tags]      SMOKE   REGRESSION      GUI
    LandingPage.Fill the Login Form     ${user_name}    ${invalid_password}
    LandingPage.Wait until Element is located in the page
    LandingPage.verify error message is correct

Validate Cards display in the Shopping Page
    [Tags]      REGRESSION      GUI
    LandingPage.Fill The Login Form     ${user_name}    ${valid_password}
    ShopPage.Wait until Element is located in the page
    ShopPage.Verify Card titles in the Shop page
    Add Items To Cart And Checkout      ${listOfProducts}
    CheckoutPage.Verify itmes in the Checkout Page and proceed
    ConfirmationPage.Enter the Country and select the terms       ${country_name}
    ConfirmationPage.Purchuse the Product and Confirm the Purchase

Select the Form and navigate to Child windows
    [Tags]      REGRESSION      GUI
    LandingPage.Fill the Login Details and select the User option   ${user_name}    ${valid_password}











