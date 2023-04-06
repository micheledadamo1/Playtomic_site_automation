*** Settings ***
Library         SeleniumLibrary


*** Variables ***     #TODO refactor
${current month and year} =     'default'
${court_number} =               4       #TODO
${time_slot} =                  80      #TODO note: 1 slot = +40, 9 AM = 80

*** Keywords ***
Verify club page load
    [Arguments]                     ${club name substring}
    Wait Until Page Contains        ${club name substring}

Select sport type       #TODO
    [Documentation]                 TENNIS or PADDEL
    [Arguments]                     ${sport type}

    #sport type
    #Click Element                   //div[@class='bbq2__sport_input']
    Click Element                   (//div[@class='bbq2__search']//div[@role='button'])[1]

Select date
    [Documentation]                 month in italian, day 2 digits always (1 -> 01)
    [Arguments]                     ${month}    ${day}

    #date calendar
    #Click Element                   (//button[@type='button' and @class='bbq2__drop__toggle'] )[2]
    Wait Until Page Contains Element    (//div[@class='bbq2__search']//div[@role='button'])[2]
    Click Element                   (//div[@class='bbq2__search']//div[@role='button'])[2]

    #manage month
    ${current month and year} =     Get Text    (//div[@class='date-picker__month-text'])[2]
    WHILE   "${month}" not in "${current month and year}"
        Click Element    (//a[@class='date-picker__month-arrow'])[4]
        ${current month and year} =     Get Text    (//div[@class='date-picker__month-text'])[2]
    END

    #select day
    click element                   (//a[@class='date-picker__day' and .='${day}'])[2]

Select court
    #check field availability
    Wait Until Page Contains Element    //div[@class='bbq2__grid']/div[@class='bbq2__availability']/div[@class='bbq2__slots']
    #Click Element                   //div[@class='bbq2__grid']/div[@class='bbq2__availability']/div[@class='bbq2__slots']/div[4]/div[@style='left: 80px; width: 40px;']
    Click Element                   //div[@class='bbq2__grid']/div[@class='bbq2__availability']/div[@class='bbq2__slots']/div[${court_number}]/div[@style='left: ${time_slot}px; width: 40px;']

    #proceed with booking
    click Element                   //button[@type='button' and @class='bbq2__duration-picker__button']

Select additional filter    #todo
    [Documentation]                 asd
    [Arguments]             ${filter list}  #review


Select time             #TODO review
    [Documentation]                 asd
    [Arguments]                     ${hour}     ${mins}
