*** Settings ***
Documentation    Pop-up

Resource    ../@main.robot

*** Variables ***

${POPUP_TXT_TITULO}       accessibility_id=popupAlertaLblTitulo
${POPUP_TXT_TEXTO}        accessibility_id=popupAlertaLblTexto
${POPUP_BTN_CONFIRMAR}    accessibility_id=popupAlertaBtnAcaoOnly


*** Keywords ***
Validar se o título do pop-up está como "${titulo}"
    [Documentation]    Verificar se o título do pop-up está como "X"
    Wait Until Element Is Visible    ${POPUP_TXT_TITULO}    ${TENTATIVAS_PADRAO}
    ${get_titulo}    Get Text    ${POPUP_TXT_TITULO}
    Should Be Equal As Strings    ${titulo}    ${get_titulo}

Validar se o texto do pop-up está como "${texto}"
    [Documentation]    Validar se o texto do pop-up está como "X"
    Wait Until Element Is Visible    ${POPUP_TXT_TEXTO}    ${TENTATIVAS_PADRAO}
    ${get_texto}    Get Text    ${POPUP_TXT_TEXTO}
    Should Be Equal As Strings    ${texto}    ${get_texto}

Clicar no botão que confirma o pop-up
    [Documentation]    Clicar no botão que confirma o pop-up
    Wait Until Element Is Visible    ${POPUP_BTN_CONFIRMAR}    ${TENTATIVAS_PADRAO}
    Click Element    ${POPUP_BTN_CONFIRMAR}