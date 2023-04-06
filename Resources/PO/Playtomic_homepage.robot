*** Settings ***
Library     SeleniumLibrary
Library     String

*** Variables ***
${Xpath homepage research string} =                     //*[@id="search__home__location"]
${Xpath search result option} =                         //div[@class='option-list__label' and .='replace_string_0']    #substring_change1=search_string
${Xpath sport type button} =                            //*[@id="search__home__sport"]/div[1]
${Xpath sport type option} =                            //*[@id="search__home__sport-replace_string_0"]

#${string replaced var}


*** Keywords ***
Verify home page load
    [Documentation]             insert the name and surname of the account used to access
    [Arguments]                 ${login_account_name}
    Wait Until Page Contains    ${login_account_name}   #Michele D'Adamo

Insert search words
    [Documentation]             insert the main words to be found during the club research, it will be used also to select the result. Needs to be precise
    [Arguments]                 ${search_string}
    Input Text                  ${Xpath homepage research string}    ${search_string}

Click search result
    [Documentation]             insert the known result string option to click the right result!
    [Arguments]                 ${search_string}
    ${final search result option} =    Replace String    ${Xpath search result option}    replace_string_0    ${search_string}
    Wait Until Page Contains Element    ${final search result option}
    Mouse Over                  ${final search result option}
    Click Element               ${final search result option}

Open on calendar        #TODO
    Click Element               //*[@id="search__home__date"]/div[1]

Insert month            #TODO
    [Arguments]                 ${month}

Insert day              #TODO
    [Arguments]                 ${day}
    Click Element               xpath=//*[.='31']

Insert time             #TODO
    [Arguments]                 ${hour}  ${minutes}
    Click Element               //*[@id="search__home__hour"]/div[1]
    Click Element               xpath=//*[.='19:00']

Insert sport type
    [Documentation]             write TENNIS or PADDLE
    [Arguments]                 ${sport_type}
    #seleziona tipo sport
    Click Element               ${Xpath sport type button}
    #seleziona sport
    ${final xpath sport type option}    Replace String    ${Xpath sport type option}    replace_string_0    ${sport_type}
    Click Link                  ${final xpath sport type option}

#obsolete
#Select Milago club choise
#    Wait Until Element Is Visible    //div[@class='option-list__label' and .='Milago Tennis']
#    Mouse Over                  //div[@class='option-list__label' and .='Milago Tennis']
#    Click Element               //div[@class='option-list__label' and .='Milago Tennis']