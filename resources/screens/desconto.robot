*** Settings ***
Documentation    Desconto Item/Total

Resource    ../@main.robot

*** Variables ***
${DESCONTO_TXT_TITULO}        xpath=//android.widget.TextView[@text="Desconto no item"]
${DESCONTO_BTN_RS}            accessibility_id=DescontoItembtnSelecionarTipoDescontoMoeda
${DESCONTO_INPUT_VALOR}       accessibility_id=DescontoItemEntryDescontoInserido
${DESCONTO_TXT_VALOR_DESCONTO}    accessibility_id=DescontoItemLblValorDoDescontoValue
${DESCONTO_BTN_APLICAR}        accessibility_id=DescontoItemBtnAplicarDesconto
${DESCONTO_TXT_TOTAL_DE_DESCONTOS}    accessibility_id=DescontoItemLblValorTotalDesconto


###### Motivo Desconto ########
${MOTIVO_DESCONTO_TXT_TITULO}    accessibility_id=popupPickerLblTitulo



*** Keywords ***
Validar se foi apresentado o valor de desconto como "${valor_desconto}" na tela de 'Desconto no item'
    [Documentation]    Validar se foi apresentado o valor de desconto como "X" na tela de 'Desconto no item'
    Wait Until Element Is Visible    ${DESCONTO_TXT_VALOR_DESCONTO}    ${TENTATIVAS_PADRAO}
    ${get_valor}    Get Text    ${DESCONTO_TXT_VALOR_DESCONTO}
    Should Be Equal As Strings    ${get_valor}    ${valor_desconto}

Validar se o total de desconto está como "${desconto_total}" na tela de 'Desconto no item'
    [Documentation]    Validar se o total de desconto está como "X" na tela de 'Desconto no item'
    Wait Until Element Is Visible    ${DESCONTO_TXT_TOTAL_DE_DESCONTOS}    ${TENTATIVAS_PADRAO}
    ${get_valor_total_desconto}    Get Text    ${DESCONTO_TXT_TOTAL_DE_DESCONTOS}
    Should Be Equal As Strings    ${get_valor_total_desconto}    ${desconto_total}

Verificar se foi apresentado a tela de 'Desconto no item'
    [Documentation]    Verificar se foi apresentado a tela de 'Desconto no item'
    Wait Until Element Is Visible    ${DESCONTO_TXT_TITULO}    ${TENTATIVAS_PADRAO}

Clicar no botão de R$ na tela de 'Desconto no item'
    [Documentation]    Clicar no botão de R$ na tela de 'Desconto no item'
    Wait Until Element Is Visible    ${DESCONTO_BTN_RS}    ${TENTATIVAS_PADRAO}
    Click Element    ${DESCONTO_BTN_RS}

Clicar no botão 'Aplicar' na tela de 'Desconto no item'
    [Documentation]    Clicar no botão 'Aplicar' na tela de 'Desconto no item'
    Wait Until Element Is Visible    ${DESCONTO_BTN_APLICAR}    ${TENTATIVAS_PADRAO}
    Click Element    ${DESCONTO_BTN_APLICAR}

Inserir o valor "${valor}" na tela de 'Desconto no item'
    [Documentation]    Inserir o valor "X" na tela de 'Desconto no item'
    Wait Until Element Is Visible    ${DESCONTO_INPUT_VALOR}    ${TENTATIVAS_PADRAO}
    Click Element    ${DESCONTO_INPUT_VALOR}
    Clear Text    ${DESCONTO_INPUT_VALOR}
    Aguarde "2" segundos
    Input Text    ${DESCONTO_INPUT_VALOR}    ${valor}
    Aguarde "1" segundos
    Press Keycode    66






############## Motivo Desconto ###############
Verificar se foi apresentado a tela de 'Motivo' do desconto
    [Documentation]    Verificar se foi apresentado a tela de 'Motivo' do desconto
    Wait Until Element Is Visible    ${MOTIVO_DESCONTO_TXT_TITULO}    ${TENTATIVAS_PADRAO}

Clicar na opção "${movito_desconto}" do motivo do Desconto
    [Documentation]    Clicar na opção "X" do motivo do Desconto
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@content-desc="popupPickerLblDescricao" and @text='${movito_desconto}']    ${TENTATIVAS_PADRAO}
    Click Element    xpath=//android.widget.TextView[@content-desc="popupPickerLblDescricao" and @text='${movito_desconto}']