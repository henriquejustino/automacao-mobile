*** Settings ***
Documentation       Carrinho

Resource            ../resources/@main.robot

Test Setup          Abrir App
Test Teardown       Fechar App


*** Test Cases ***

Cenário: Validar inserir um produto no carrinho
    [Documentation]    Validar inserir um produto no carrinho
    [Tags]    carrinho
    Inserir login "xxxxx" e senha "xxxxx" na tela de Login
    Verificar se foi apresentado a 'Tela Principal'
    Clicar no botão de 'Nova Venda'
    Verificar se foi apresentado a tela de 'Em Atendimento'
    Inserir o código do produto como "21021"
    Validar se o produto "21021" foi apresentado na tela de 'Em Atendimento'
    Clicar no 'X' do produto "21021" para remover o produto na tela de 'Carrinho'
    Aguarde "10" segundos

Cenário: Validar excluir um item no carrinho
    [Documentation]    Cenário: Validar excluir um item no carrinho
    [Tags]    carrinho
    Inserir login "xxxxx" e senha "xxxxx" na tela de Login
    Verificar se foi apresentado a 'Tela Principal'
    Clicar no botão de 'Nova Venda'
    Verificar se foi apresentado a tela de 'Em Atendimento'
    Inserir o código do produto como "21021"
    Validar se o produto "21021" foi apresentado na tela de 'Em Atendimento'
    Clicar no 'X' do produto "21021" para remover o produto na tela de 'Carrinho'
    Validar se apresentou o texto "Sem itens adicionados" na tela de carrinho
    Aguarde "10" segundos