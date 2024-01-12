*** Settings ***
Documentation    Tela Principal

Resource    ../@main.robot

*** Variables ***

${HOME_BTN_MENU}        accessibility_id=OK
${HOME_BTN_NOVA_VENDA}    xpath=//android.widget.TextView[contains(@text, 'Nova')]
${HOME_BTN_NOSSOS_PRODUTOS}    xpath=//android.widget.TextView[contains(@text, 'Produtos')]


*** Keywords ***
Verificar se foi apresentado a 'Tela Principal'
    [Documentation]
    Wait Until Element Is Visible    ${HOME_BTN_MENU}    ${TENTATIVAS_PADRAO}

Clicar no botão de 'Nova Venda'
    [Documentation]    
    Wait Until Element Is Visible    ${HOME_BTN_NOVA_VENDA}    ${TENTATIVAS_PADRAO}
    Click Element    ${HOME_BTN_NOVA_VENDA}

Clicar no botão de 'Nossos Produtos'
    [Documentation]    Clicar no botão de 'Nossos Produtos'
    Wait Until Element Is Visible    ${HOME_BTN_NOSSOS_PRODUTOS}    ${TENTATIVAS_PADRAO}
    Click Element    ${HOME_BTN_NOSSOS_PRODUTOS}
