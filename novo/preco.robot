*** Settings ***

Library    SeleniumLibrary
Library    ExcelLibrary
Library    OperatingSystem    

*** Variables ***

${c}    Chrome
${f}    fone de ouvido jbl t110
${p}    Planilha Teste
${a}    Amazon
${m}    Magazine Luiza
${l}    Mercado Livre

*** Keywords ***

Open
    Browser

#Planilha
#    Excel

Texto    
    Bloco

*** Test cases ***

Browser
    OpenBrowser    https://www.amazon.com.br/    ${c}
    Sleep    10s    
    Wait Until Element Is Visible    //*[@id="twotabsearchtextbox"]
    Sleep    1s    
    Input Text    //*[@id="twotabsearchtextbox"]    ${f}
    Sleep    1s   
    Press Keys    none    ENTER  
    Sleep    1s

   ${CONDICAO}    Run Keyword And Return Status   Wait Until Element Is Visible    //*[@id="search"]/div[1]/div[1]/div/span[1]/div[1]/div[4]/div/div/div/div/div[1]/span/a/div
        IF  ${CONDICAO}
        Sleep    1s
        Click Element    //*[@id="search"]/div[1]/div[1]/div/span[1]/div[1]/div[4]/div/div/div/div/div[1]/span/a/div
        ELSE
        Click Element    //*[@id="search"]/div[1]/div[1]/div/span[1]/div[1]/div[3]/div/div/div/div/div[1]/span/a/div
        END

    Sleep    1s
    ${nome} =    Get Text    //*[@id="productTitle"]
    # =    Get Text    //*[@id="productTitle"]
    Log    ${nome}
    Sleep    1s 
    Wait Until Element Is Visible    //*[@id="corePrice_feature_div"]/div/span[1]/span[2]/span[2]
    Sleep    1s    
    ${preco} =    Get Text    //*[@id="corePrice_feature_div"]/div/span[1]/span[2]/span[2]

    # =    Get Text    //*[@id="corePrice_feature_div"]/div/span[1]/span[2]/span[2]    
    Log    ${preco}
    Sleep    1s  
    
    Go To    https://www.magazineluiza.com.br/
    Sleep    1s
    Wait Until Element Is Visible    //*[@id="input-search"]
    Sleep    1s    
    Input Text    //*[@id="input-search"]    ${f}
    Sleep    1s   
    Press Keys    none    ENTER  
    Sleep    1s
    Wait Until Element Is Visible    //*[@id="__next"]/div/main/section[4]/div[3]/div/ul/li[1]/a
    Sleep    1s
    Click Element    //*[@id="__next"]/div/main/section[4]/div[3]/div/ul/li[1]/a   
    Sleep    1s
    Wait Until Element Is Visible    //*[@id="__next"]/div/main/section[2]/div[2]/h1
    Sleep    1s
    ${nome2} =    Get Text    //*[@id="__next"]/div/main/section[2]/div[2]/h1
    # =    Get Text    //*[@id="__next"]/div/main/section[2]/div[2]/h1
    Log    ${nome}
    Sleep    1s 
    Wait Until Element Is Visible    //*[@id="__next"]/div/main/section[4]/div[4]/div/div/div/div/p
    Sleep    1s    
    ${preco2} =    Get Text    //*[@id="__next"]/div/main/section[4]/div[4]/div/div/div/div/p

    Go To    https://www.mercadolivre.com.br/
    Sleep    1s
    Wait Until Element Is Visible    //*[@id="cb1-edit"]
    Sleep    1s    
    Input Text    //*[@id="cb1-edit"]    ${f}
    Sleep    1s   
    Press Keys    none    ENTER  
    Sleep    1s
    Wait Until Element Is Visible    //*[@id=":rj:"]/div[2]/div/div[2]/a
    Sleep    1s
    Click Element    //*[@id=":rj:"]/div[2]/div/div[2]/a   
    Sleep    1s
    Wait Until Element Is Visible    //*[@id="ui-pdp-main-container"]/div[1]/div/div[1]/div[2]/div[1]/div/div[2]/h1
    Sleep    1s
    ${nome3} =    Get Text    //*[@id="ui-pdp-main-container"]/div[1]/div/div[1]/div[2]/div[1]/div/div[2]/h1  
    Sleep    1s
    Wait Until Element Is Visible    //*[@id="ui-pdp-main-container"]/div[1]/div/div[1]/div[2]/div[3]/div[1]/div[1]/span/span[3]
    Sleep    1s    
    ${preco3} =    Get Text    //*[@id="ui-pdp-main-container"]/div[1]/div/div[1]/div[2]/div[3]/div[1]/div[1]/span/span[3]

    Close Browser

    Create File    output.txt

    Append To File    output.txt    ${nome}\n
    Append To File    output.txt    ${preco}\n
    Append To File    output.txt    ${a}\n\n
    Append To File    output.txt    ${nome2}\n
    Append To File    output.txt    ${preco2}\n
    Append To File    output.txt    ${m}\n\n
    Append To File    output.txt    ${nome3}\n
    Append To File    output.txt    ${preco3}\n
    Append To File    output.txt    ${l}\n



#Excel
#    Open Excel Document    filename=planilhateste.xlsx    doc_id=1
#    Set Cell Value    Planilha1    A1    ${nome}    
#    Set Cell Value    Planilha1    B1    ${preco}    

#Bloco
#    Create File    output.txt
#    Append To File    output.txt    ${nome}
#    Append To File    output.txt    ${preco}
    

    

        



    
