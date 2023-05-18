*** Settings ***
Documentation       All the page objects and keywords of Shop page
Library             SeleniumLibrary
Resource            Generic.robot

*** Variables ***
${Shop_page_load}       //a[text()='Category 1']

*** Keywords ***
Wait until Element is located in the page
    Generic wait until element passed is located on Page       ${Shop_page_load}

Verify Card titles in the Shop page
    ${expectedList} =    Create List    iphone X     Samsung Note 8      Nokia Edge      Blackberry
    ${elements} =    Get Webelements     //h4[@class='card-title']/a
    ${actualList} =     Create List
    FOR     ${element}  IN      @{elements}
        Log    ${element.text}
        Append To List  ${actualList}   ${element.text}
    END
    Lists Should Be Equal   ${expectedList}     ${actualList}

Select the Card
    [arguments]     ${cardName}
    ${elements} =    Get Webelements     //h4[@class='card-title']/a
    ${index} =      Set Variable    1
    FOR     ${element}  IN      @{elements}
        Exit For Loop If    '${cardName}' == '${element.text}'
        ${index} =  Evaluate    ${index} + 1
    END
    Click Button    (//div[@class='card-footer'])[${index}]/button