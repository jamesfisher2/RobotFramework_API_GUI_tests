*** Settings ***
Documentation    All the page objects and keywords of landing page
Library          SeleniumLibrary
Resource            Generic.robot

*** Variables ***
${Error_Massage_Login}  //div[@class='alert alert-danger col-md-12']

*** Keywords ***
Fill the Login Form
    [arguments]     ${username}     ${password}
    Input Text      //input[@id='username']     ${username}
    Input Password  //input[@id='password']     ${password}
    Click Button    //input[@id='signInBtn']

Wait until Element is located in the page
    Generic wait until element passed is located on Page       ${Error_Massage_Login}

verify error message is correct
    Element Text Should Be    ${Error_Massage_Login}    Incorrect username/password.

Fill the Login Details and select the User option
    [arguments]     ${username}     ${password}
    Input Text      //input[@id='username']     ${username}
    Input Password  //input[@id='password']     ${password}
    Click Element   //input[@value='user']
    Wait Until Element Is Visible       //button[@id='okayBtn']
    Click Button                        //button[@id='okayBtn']
    Click Button                        //button[@id='okayBtn']
    Wait Until Element Is Not Visible   //button[@id='okayBtn']
    Select From List By Value           //select[@class='form-control']    teach
    Select Checkbox                     //input[@id='terms']
    Checkbox Should Be Selected         //input[@id='terms']