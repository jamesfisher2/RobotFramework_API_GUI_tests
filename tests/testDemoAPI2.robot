*** Settings ***
Library     Collections
Library     RequestsLibrary

*** Variables ***
${base_rul}     https://216.10.245.166
${book_id}
${book_name}    RobotFramework

*** Test Cases ***
Add Book into Library DataBase
    [Tags]    SMOKE     REGRESSION      API
    &{req_body}=    Create Dictionary    name=${book_name}    isbn=23835483    aisle=252989d57     author=rahulhetty
    ${response}=    POST    ${base_rul}/Library/Addbook.php     json=${req_body}    expected_status=200
    log             ${response.json()}

    #checking the presence of key=ID from json
    Dictionary Should Contain Key    ${response.json()}     ID

    #checking the =value for ID key from json
    ${book_id}=    Get From Dictionary    ${response.json()}      ID
    Set Global Variable     ${book_id}
    Log     ${book_id}

    #checking value for Msg from json
    Should Be Equal As Strings      ${response.json()}[Msg]     successfully added
    Status Should Be    200

Get the Book Details which got added
    [Tags]      REGRESSION      API
    ${get_response}=    GET     ${base_rul}/Library/GetBook.php     params=ID=${book_id}    expected_status=200
    Log         ${get_response.json()}
    # the response is [{'book_name' : 'RobotFramework', 'isbn':'943203', 'aisle': '23453', 'author: 'rahulshetty'}]
    # It's a list of dicionaries. In order to get the first element of the list we have to use [0]
    Should Be Equal As Strings    ${get_response.json()}[0][book_name]       ${book_name}
    Status Should Be    200

Delete the Book from database
    [Tags]      REGRESSION      API
    &{delete_req}=      Create Dictionary       ID=${book_id}
    ${delete_resp}=    POST    ${base_rul}/Library/DeleteBook.php      json=${delete_req}   expected_status=200
    Should Be Equal As Strings        Log     ${delete_resp.json()}[msg]        book is successfully deleted
    Status Should Be    200