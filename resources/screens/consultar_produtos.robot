*** Settings ***
Documentation    Consultar Produtos

Resource    ../@main.robot

*** Variables ***
${CONSULTAR_PRODUTOS_TXT_TITULO}        xpath=//android.widget.EditText[@text="Consultar produto"]



*** Keywords ***
Verificar se foi apresentado a tela de 'Consulta de produtos'
    [Documentation]    Verificar se foi apresentado a tela de 'Consulta de produtos'
    Wait Until Element Is Visible    ${CONSULTAR_PRODUTOS_TXT_TITULO}    ${TENTATIVAS_PADRAO}

Verificar se foi apresentado o produto "${nome_produto}" com o código de produto "${codigo_produto}"
    [Documentation]    Verificar se foi apresentado o produto "X" com o código de produto "X"
    Wait Until Element Is Visible    accessibility_id=consultarProdutoLblDescricaoListProdutos${codigo_produto}    ${TENTATIVAS_PADRAO}
    ${get_nome_produto}    Get Text    accessibility_id=consultarProdutoLblDescricaoListProdutos${codigo_produto}
    Should Be Equal As Strings    ${nome_produto}    ${get_nome_produto}