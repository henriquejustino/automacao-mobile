*** Settings ***
Documentation       Carrinho

Resource            ../@main.robot


*** Variables ***
${CARRINHO_LBL_TITULO}              accessibility_id=carrinhoLblNavibarTituloAndroid
${CARRINHO_INPUT_CODIGO_PRODUTO}    xpath=//android.widget.EditText[@text="Consultar produto"]
${CARRINHO_LBL_SEM_ITENS}           accessibility_id=carrinhoLblExistemRegistros


*** Keywords ***
Verificar se foi apresentado a tela de 'Em Atendimento'
    [Documentation]    Verificar se foi apresentado a tela de 'Em Atendimento'
    Wait Until Element Is Visible    ${CARRINHO_LBL_TITULO}    ${TENTATIVAS_PADRAO}

Validar se o produto "${produto}" foi apresentado na tela de 'Em Atendimento'
    [Documentation]    Validar se o produto foi apresentado na tela de 'Em Atendimento'
    Wait Until Element Is Visible    accessibility_id=carrinhoLblDescricao${produto}    ${TENTATIVAS_PADRAO}

Validar se o produto "${produto}" foi apresentado com o valor de "${valor_produto}"
    [Documentation]    Validar se o produto "X" está com o valor de "X"
    Wait Until Element Is Visible    accessibility_id=carrinhoLblQuantidadeServico${produto}    ${TENTATIVAS_PADRAO}
    ${get_preco}    Get Text    accessibility_id=carrinhoLblQuantidadeServico${produto}
    Should Be Equal As Strings    ${get_preco}    ${valor_produto}

Validar se foi aplicado o desconto de "${valor_desconto}" do produto "${codigo_produto}" na tela do 'Carrinho'
    [Documentation]    Validar se foi aplicado o desconto de "X" na tela do 'Carrinho'
    Wait Until Element Is Visible
    ...    accessibility_id=carrinhoLblAcrescimoDescontoItemDescricao${codigo_produto}
    ...    ${TENTATIVAS_PADRAO}
    ${get_valor_desconto_item}    Get Text
    ...    accessibility_id=carrinhoLblAcrescimoDescontoItemDescricao${codigo_produto}
    Should Be Equal As Strings    ${valor_desconto}    ${get_valor_desconto_item}

Validar se apresentou o texto "${texto}" na tela de carrinho
    [Documentation]    Validar se apresentou o texto "X" na tela de carrinho
    Wait Until Element Is Visible    ${CARRINHO_LBL_SEM_ITENS}    ${TENTATIVAS_PADRAO}
    ${get_texto}    Get Text    ${CARRINHO_LBL_SEM_ITENS}
    Should Be Equal As Strings    ${texto}    ${get_texto}

Inserir o código do produto como "${codigo}"
    [Documentation]    Inserir o código do produto como "X"
    Wait Until Element Is Visible    ${CARRINHO_INPUT_CODIGO_PRODUTO}    ${TENTATIVAS_PADRAO}
    Click Element    ${CARRINHO_INPUT_CODIGO_PRODUTO}
    Aguarde "2" segundos
    Input Text    ${CARRINHO_INPUT_CODIGO_PRODUTO}    ${codigo}
    Aguarde "1" segundos
    Press Keycode    ${ENTER}

Clicar no botão para aplicar desconto no item "${codigo_produto}"
    [Documentation]    Clicar no botão para aplicar desconto no item "X"
    Wait Until Element Is Visible    accessibility_id=carrinhoLblTags${codigo_produto}    ${TENTATIVAS_PADRAO}
    Click Element    accessibility_id=carrinhoLblTags${codigo_produto}

Clicar na opção "${nome_desconto}" na tela de 'Ação com o item'
    [Documentation]    Clicar na opção "X" na tela de 'Ação com o item'
    Wait Until Element Is Visible
    ...    xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="${nome_desconto}"]
    Click Element    xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="${nome_desconto}"]

Clicar no 'X' do produto "${codigo_produto}" para remover o produto na tela de 'Carrinho'
    [Documentation]    Clicar no 'X' do produto "X" para remover o produto na tela de 'Carrinho'
    Wait Until Element Is Visible
    ...    accessibility_id=carrinhoLblRemoverItemCarrinho${codigo_produto}
    ...    ${TENTATIVAS_PADRAO}
    Click Element    accessibility_id=carrinhoLblRemoverItemCarrinho${codigo_produto}
