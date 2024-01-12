*** Settings ***
Documentation       Desconto

Resource            ../resources/@main.robot

Test Setup          Abrir App
Test Teardown       Fechar App


*** Test Cases ***

Cenario: Aplicar desconto no item
    [Documentation]    Aplicar desconto no item
    [Tags]    desconto
    Inserir login "xxxxx" e senha "xxxxx" na tela de Login
    Verificar se foi apresentado a 'Tela Principal'
    Clicar no botão de 'Nova Venda'
    Verificar se foi apresentado a tela de 'Em Atendimento'
    Inserir o código do produto como "21021"
    Validar se o produto "21021" foi apresentado na tela de 'Em Atendimento'
    Validar se o produto "21021" foi apresentado com o valor de "R$ 50,00"
    Clicar no botão para aplicar desconto no item "21021"
    Clicar na opção "Desconto" na tela de 'Ação com o item'
    Verificar se foi apresentado a tela de 'Desconto no item'
    Clicar no botão de R$ na tela de 'Desconto no item'
    Inserir o valor "10,00" na tela de 'Desconto no item'
    Verificar se foi apresentado a tela de 'Motivo' do desconto
    Clicar na opção "TESTE AUTOMACAO" do motivo do Desconto
    Validar se foi apresentado o valor de desconto como "R$ 10,00" na tela de 'Desconto no item'
    Validar se o total de desconto está como "R$ 10,00" na tela de 'Desconto no item'
    Clicar no botão 'Aplicar' na tela de 'Desconto no item'
    Validar se foi aplicado o desconto de "(-) R$ 10,00" do produto "21021" na tela do 'Carrinho'
    Clicar no 'X' do produto "21021" para remover o produto na tela de 'Carrinho'
    Aguarde "5" segundos
