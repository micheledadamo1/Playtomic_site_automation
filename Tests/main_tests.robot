*** Settings ***
Documentation   gestione della prenotazione partite in automatico da chrome sul sito playtomic

Library     SeleniumLibrary
Library     Dialogs

*** Variables ***
${log_vari}

*** Test Cases ***
Test 1
    [Documentation]     prova
    [Tags]      prova

    Set Selenium Speed    .1s
    Set Selenium Timeout    5s

    Log                 inizio test 1
    Open Browser        https://playtomic.io/   chrome

    ###
    #resize browser window for recording
    #Set Window Position    x=341    y=169
    #Set Window Size    width=1935    height=1090
    ###

    Wait Until Page Contains    Login / registrati

    #click accetta
    Click Link      xpath=//*[@id="root"]/div/div[1]/div/div[2]/a
    #click log in
    Click Link      xpath=//*[@id="sign-buttons__sign-in"]
    #non funziona in incognito Click Button    xpath=//*[@id="sign__google"]
    # inserisci mail
    Input Text      //*[@id="sign-in__email"]    michele.dadamo1@gmail.com
    # inserisci pwd
    Input Password  //*[@id="sign-in__password"]    Playtomicmicmic88**
    #prosegui
    Click Button    //*[@id="sign-in__submit"]
    
    Wait Until Page Contains    Michele D'Adamo

    #seleziona tipo sport
    Click Element   xpath=//*[@id="search__home__sport"]/div[1]
    #seleziona sport
    Click Link      xpath=//*[@id="search__home__sport-TENNIS"]

    #selezione data
    #TODO calcola prossima data
    #apri calendario
    Click Element    //*[@id="search__home__date"]/div[1]
    #TODO controlla mese/giorno
    #TODO seleziona mese
    #seleziona giorno
    #NON FUNZIONA Click Element    <a class="date-picker__day" role="button" tabindex="-1">26</a>

    #Prossimo mese
    #Click Element    CSS=html body div#root div div.home div#banner.home__banner div.banner__elements div.banner__content form#search__home.search div.search__inputs div.search__date div#search__home__date div#search__home__date.drop-down__container.date-input div.drop-down.drop-down--open div#search__home__date__date-picker.date-picker div.date-picker__month a.date-picker__month-arrow svg.icon.icon--chevron.icon--chevron-right
    #Mese precedente
    #Click Element    CSS=html body div#root div div.home div#banner.home__banner div.banner__elements div.banner__content form#search__home.search div.search__inputs div.search__date div#search__home__date div#search__home__date.drop-down__container.date-input div.drop-down.drop-down--open div#search__home__date__date-picker.date-picker div.date-picker__month a.date-picker__month-arrow svg.icon.icon--chevron.icon--chevron-left

    #Click Link   xpath=//*/form[@id="search__home"]//*/li/a[@class='date-picker__day date-picker__day--disabled' and .='03']
    Click Element    xpath=//*[.='17']

    Click Element    //*[@id="search__home__hour"]/div[1]
    Click Element    xpath=//*[.='19:00']

    Input Text    //*[@id="search__home__location"]    Milano
    Wait Until Page Contains    Milano, MI, Italia
    Click Element    //*[.='Milano, MI, Italia']

    Click Button    id=search__home__submit

    ${log_vari}=    Get WebElement    //*[contains(@href,'milago-tennis')]

html body div#root div div.search2-page div.search2-page__content div.search2-page__results div.search2-page__cards div article#card-35f455b8-f7aa-4dea-ac6d-1b841b4a2412.card.card2 div.card__body div.slots a#2023-02-13T18:00:00.button.button--filled div
https://playtomic.io/search?search__dateValue=2023-02-13&search__isSearchingFromMap=false&search__placeLocation=45.464204%2C9.189982&search__placeText=Milano%2C%20MI%2C%20Italia&search__radius=50000&search__sportValue=TENNIS&search__timeValue=19%3A00&search__timeZone=utc%2B01%3A00&search__zoom=8

    Mouse Over    //*[.='Milago Tennis']
    sleep       5s

    Close Browser

*** Keywords ***