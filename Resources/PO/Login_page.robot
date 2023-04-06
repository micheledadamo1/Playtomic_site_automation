*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${email}        michele.dadamo1@gmail.com
${pwd}          Playtomicmicmic88**

${verify page string}                               Login / registrati
${Xpath accetta button on privacy banner}           //*[@id="root"]/div/div[1]/div/div[2]/a
${Xpath login button}                               //*[@id="sign-buttons__sign-in"]
${Xpath email field}                                //*[@id="sign-in__email"]
${Xpath password field}                             //*[@id="sign-in__password"]
${Xpath submit button}                              //*[@id="sign-in__submit"]

*** Keywords ***
Go to playtomic login page
    [Arguments]     ${web_site}
    Go To           ${web_site}

Verify Page Load
    Wait Until Page Contains    ${verify page string}

Close privacy banner
    #Click accetta
    Click Link      ${Xpath accetta button on privacy banner}

click "login" button
    #click log in
    Click Link      ${Xpath login button}

#following fields are visible only after "login" button press
fill login data
    [Arguments]     ${email}    ${pwd}
    # inserisci mail
    Input Text      ${Xpath email field}       ${email}
    # inserisci pwd
    Input Password  ${Xpath password field}    ${pwd}

click "submit" button
    #prosegui
    Click Button    ${Xpath submit button}
