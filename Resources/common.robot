*** Settings ***
Library     SeleniumLibrary

*** Variables ***


*** Keywords ***
Begin Web Test
    Set Selenium Speed      .2s
    Set Selenium Timeout    10s
    #open the browser
    #log                    Starting the test case!
    Open Browser            about:blank     ${BROWSER}

    #resize browser window for recording
    Set Window Position    x=341    y=169
    Set Window Size    width=1935    height=1090


End Web Test
    Close All Browsers