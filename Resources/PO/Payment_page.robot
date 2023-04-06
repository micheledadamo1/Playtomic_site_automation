*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${Xpath PAY button}                         //button[@type='button' and @class='button button--filled button--primary']

*** Keywords ***
Verify payment page loaded      #TODO
    Wait Until Page Contains    'Dati di pagamento'
    Wait Until Page Contains    'Modalità di pagamento'

Verify data of the booking      #TODO
    #servono gli input
    #Wait Until Page Contains Element    //div[@class='checkout__details']/div/div[@class='checkout__tenant' and .='Milago Tennis']
    #Wait Until Page Contains Element    //div[@class='checkout__details']/div/div[@class='checkout__sport' and .='Tennis']
    #Wait Until Page Contains Element    //div[@class='checkout__details']/div/div[@class='checkout__features']/div/div[controllare che ci siano i vari elementi COME???
    #RIPETERE IL PRECEDENTE PER TUTTI I CONTROLLI DEL CASO
Continua con il pagamento
    Click Element               ${Xpath PAY button}