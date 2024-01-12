*** Settings ***
Documentation       Login

Resource            ../resources/@main.robot

Test Setup          Abrir App
Test Teardown       Fechar App


*** Test Cases ***
Cenario: Logar com usuario e senha valido
    [Documentation]    Esse teste valida o login com usuario e senha valido
    [Tags]    login
    Inserir login "xxxxx" e senha "xxxxx" na tela de Login
    Verificar se foi apresentado a 'Tela Principal'

Cenario: Logar com usuario e senha invalidos
    [Documentation]    Logar com usuario e senha invalidos
    [Tags]    login
    Inserir login "errado" e senha "errado" na tela de Login
    Validar se o título do pop-up está como "Atenção"
    Validar se o texto do pop-up está como "Usuário ou senha inválidos"
    Clicar no botão que confirma o pop-up
    Verificar se foi apresentado o logo na tela de Login