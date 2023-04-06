*** Settings ***
Documentation       tests to book a playground for testing
Library             SeleniumLibrary
Resource            ../Resources/PO/Login_page.robot
Resource            ../Resources/PO/Club_page.robot
Resource            ../Resources/PO/Playtomic_homepage.robot
Resource            ../Resources/PO/Payment_page.robot
Resource            ../Resources/common.robot
Test Setup          common.Begin Web Test
Test Teardown       common.End Web Test

#run this script memo
#robot .d result tests/playground_booking.robot

*** Variables ***
${BROWSER}                      chrome
${PLAYTOMIC_MAIN_PAGE}          https://playtomic.io/
${ACCOUNT_USER_NAME_DESC}       Michele D'Adamo
${TENNIS_CLUB_NAME_RESEARCH}    Milago Tennis
${MONTH_BOOKING}                aprile
${DAY_BOOKING_2DIGITS}          03

${EMAIL}                        michele.dadamo1@gmail.com
${PWD}                          Playtomicmicmic88**


*** Test Cases ***

Log in procedure
    [Documentation]         enter on landing site page and access
    [Tags]                  asd

    Login_page.Go to playtomic login page       ${PLAYTOMIC_MAIN_PAGE}
    Login_page.Verify Page Load
    Login_page.Close privacy banner
    Login_page.click "login" button
    Login_page.fill login data                  ${EMAIL}    ${PWD}
    Login_page.click "submit" button

#Search club
    Playtomic_homepage.Verify home page load    ${ACCOUNT_USER_NAME_DESC}
    Playtomic_homepage.Insert search words    ${TENNIS_CLUB_NAME_RESEARCH}
    Playtomic_homepage.Click search result    ${TENNIS_CLUB_NAME_RESEARCH}

    Club_page.Verify club page load     ${TENNIS_CLUB_NAME_RESEARCH}
    Club_page.Select date    ${MONTH_BOOKING}    ${DAY_BOOKING_2DIGITS}
    Club_page.Select court

    Payment_page.Verify payment page loaded
    Payment_page.Verify data of the booking
    #Payment_page.Continua con il pagamento

    sleep   10s


#Check availability

#Book

#Check booking

#Invite Tito