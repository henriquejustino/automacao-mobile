*** Settings ***
Documentation       Consultar Produtos

Resource            ../resources/@main.robot

Test Setup          Abrir App
Test Teardown       Fechar App


*** Test Cases ***
Cenário: Consultar um produto
    [Documentation]    Consultar um produto
    [Tags]    consultar_produtos
    Inserir login "xxxxx" e senha "xxxxx" na tela de Login
    Verificar se foi apresentado a 'Tela Principal'
    Clicar no botão de 'Nossos Produtos'
    Verificar se foi apresentado a tela de 'Consulta de produtos'
    Inserir o código do produto como "205205"
    Verificar se foi apresentado o produto "XXXXXXXXXXXXXXX" com o código de produto "205205"
    Aguarde "10" segundos