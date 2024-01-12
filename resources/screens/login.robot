*** Settings ***
Documentation    Login

Resource    ../@main.robot

*** Variables ***

${LOGIN_IMG_LOGO}           accessibility_id=loginImgLogo
${LOGIN_TXT_MEU_APP_MOVEL}    accessibility_id=loginLblProduto
${LOGIN_INPUT_USUARIO}            accessibility_id=loginEntryUsuario
${LOGIN_INPUT_SENHA}              accessibility_id=loginEntrySenha
${LOGIN_BTN_ENTRAR}               accessibility_id=loginBtnEntrar
${LOGIN_BTN_MOSTRAR_SENHA}        accessibility_id=loginLblMostrarSenha
${LOGIN_TXT_versao_app}           accessibility_id=loginLblVersao


*** Keywords ***
Verificar se foi apresentado o logo na tela de Login
    [Documentation]    Verificar se foi apresentado o logo na tela de Login
    Wait Until Element Is Visible    ${LOGIN_IMG_LOGO}    ${TENTATIVAS_PADRAO}

Inserir login "${login}" e senha "${senha}" na tela de Login
    [Documentation]
    Verificar se foi apresentado o logo na tela de Login
    Wait Until Element Is Visible    ${LOGIN_TXT_MEU_APP_MOVEL}    ${TENTATIVAS_PADRAO}
    Sleep    1
    Input Text    ${LOGIN_INPUT_USUARIO}    ${login}
    Hide Keyboard
    ${get_login}    Get Text    ${LOGIN_INPUT_USUARIO}
    Log    Inseriu o login como: ${get_login}
    IF    $get_login != '${login}'
        FOR    ${counter}    IN RANGE    0    4
            Click Element    ${LOGIN_INPUT_USUARIO}
            Clear Text    ${LOGIN_INPUT_USUARIO}
            Input Text    ${LOGIN_INPUT_USUARIO}    ${login}
            Hide Keyboard
            ${get_for_login}    Get Text    ${LOGIN_INPUT_USUARIO}
            Sleep    1
            Log    Inseriu o login no for como: ${get_for_login}
            IF    $get_for_login == '${login}'                BREAK
        END
    END

    Wait Until Element Is Visible    ${LOGIN_INPUT_SENHA}    ${TENTATIVAS_PADRAO}
    Click Element    ${LOGIN_INPUT_SENHA}
    Input Text    ${LOGIN_INPUT_SENHA}    ${senha}
    Hide Keyboard
    Sleep    2
    Clicar no botão 'Mostrar senha'
    ${get_senha}    Get Text    ${LOGIN_INPUT_SENHA}
    Log    Inseriu a senha como: ${get_senha}
    IF    $get_senha != '${senha}'
        FOR    ${counter}    IN RANGE    0    4
            Click Element    ${LOGIN_INPUT_SENHA}
            Clear Text    ${LOGIN_INPUT_SENHA}
            Input Text    ${LOGIN_INPUT_SENHA}    ${senha}
            Hide Keyboard
            Sleep    2
            ${get_for_senha}    Get Text    ${LOGIN_INPUT_SENHA}
            Sleep    1
            Log    Inseriu a senha como: ${get_for_senha}
            IF    $get_for_senha == '${senha}'                BREAK
        END
    END
    Clicar no botão 'Entrar' na tela de Login

Clicar no botão 'Mostrar senha'
    [Documentation]    Clicar no botão 'Mostrar senha'
    Wait Until Element Is Visible    ${LOGIN_BTN_MOSTRAR_SENHA}    ${TENTATIVAS_PADRAO}
    Click Element    ${LOGIN_BTN_MOSTRAR_SENHA}

Clicar no botão 'Entrar' na tela de Login
    [Documentation]    Clicar no botão 'Entrar' na tela de Login
    Wait Until Element Is Visible    ${LOGIN_BTN_ENTRAR}    ${TENTATIVAS_PADRAO}
    Click Element    ${LOGIN_BTN_ENTRAR}
