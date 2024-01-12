*** Settings ***
Resource    ../@main.robot


*** Variables ***
${DIRETORIO_APK}            C:\\Users\\henrique.justino\\APK\\
${PREFIXO_APP}              com.nome.doApp
${QRCODE_TXT_ESCANEIE}      accessibility_id=loadLblEscaneieOQrCode
${QRCODE_IMG_LUPA}          accessibility_id=loadImgScanner


*** Keywords ***
Abrir App
    Open Application    http://localhost:4723/wd/hub
    ...    automationName=${automationName}
    ...    platformName=${platformName}
    ...    deviceName=${deviceName}
    ...    appPackage=${appPackage}
    ...    appActivity=${appActivity}
    ...    udid=${udid}
    ...    platformVersion=${platformVersion}
    ...    avd=${avd}
    ...    autoGrantPermissions=true
    ...    noReset=true
    ...    fullReset=false

Instalar o aplicativo e abrir
    Open Application    http://localhost:4723/wd/hub
    ...    automationName=${automationName}
    ...    platformName=${platformName}
    ...    deviceName=${deviceName}
    ...    app=C:\\Users\\henrique.justino\\APK\\${global_apk}
    ...    udid=${udid}
    ...    platformVersion=${platformVersion}
    ...    avd=${avd}
    ...    autoGrantPermissions=true
    ...    noReset=true
    ...    fullReset=false

Fechar App
    Close Application

Aguarde "${segundos}" segundos
    [Documentation]    Aguarde "X" segundos
    Sleep    ${segundos}s

Pegando o nome do usuário do Windows
    [Documentation]    Pega o usuário ativo que vai rodar os testes
    ${output}    Run    whoami
    ${usuario_windows}    Evaluate    "${output.split('\\')[-1].strip()}"
    Set Global Variable    \${global_usuario_windows}    ${usuario_windows}

Mover o arquivo QRCode.png entre pastas
    [Documentation]    Mover o arquivo QRCode.png entre pastas
    Pegando o nome do usuário do Windows
    ${arquivo_origem}    Join Path    ${QRCODE_ORIGEM}    ${QRCODE_ARQUIVO}
    ${arquivo_destino}    Join Path
    ...    C:\\Users\\${global_usuario_windows}\\AppData\\Local\\Android\\Sdk\\emulator\\resources
    ...    ${QRCODE_ARQUIVO}

    ${file_exists}    Run Keyword And Return Status    File Should Exist    ${arquivo_origem}
    IF    ${file_exists} == True
        Copy File    ${arquivo_origem}    ${arquivo_destino}
        Aguarde "2" segundos
    ELSE
        Fail    Não foi encontrado o arquivo "QRCode.png" na pasta.
    END
    Aguarde "2" segundos

Comando CMD para verificar se o App está instalado e pegar a versão
    [Documentation]    Comando CMD para verificar se o App está instalado (AVD precisa estar aberto)
    ${comando_adb}    Set Variable    adb shell pm list packages | findstr com.nome.doApp
    ${status_cmd}    Run Process    ${comando_adb}    shell=True
    ${get_status_cmd}    Set Variable    ${status_cmd.stdout}

    IF    $get_status_cmd == 'package:com.nome.doApp'
        ${get_versao_apk}    Set Variable    adb shell dumpsys package com.nome.doApp | findstr "versionName"
        ${get_status_versao}    Run Process    ${get_versao_apk}    shell=True

        ${versao_app}    Set Variable    ${get_status_versao.stdout}
        ${versao_app}    Remove String    ${versao_app}    versionName=
        ${versao_app}    Remove String    ${versao_app}    ${SPACE}

        Set Global Variable    \${global_versao_app}    ${versao_app}

        Log    Versão do App: ${global_versao_app}
    ELSE
        Log    Aplicativo não está instalado.
    END

Abrir o AVD
    [Documentation]    Abrir o AVD
    ${validacao_avd_aberto}    Run Keyword And Return Status    Verificar se o AVD está aberto
    IF    ${validacao_avd_aberto} == False
        FOR    ${counter}    IN RANGE    0    4
            Pegando o nome do usuário do Windows

            ${command}    Set Variable
            ...    C:\\Users\\${global_usuario_windows}\\AppData\\Local\\Android\\Sdk\\emulator\\emulator.exe -avd ${avd}
            
            Start Process    ${command}    shell=True
            Aguarde "3" segundos

            ${get_validacao_avd_aberto}    Run Keyword And Return Status    Verificar se o AVD está aberto

            IF    ${get_validacao_avd_aberto} == True    BREAK
        END
    ELSE
        Log    AVD já está aberto.
    END
    Aguarde "15" segundos

Fechar o AVD
    [Documentation]    Fechar o AVD pelo comando ADB
    ${resultado}    Run Process    adb emu kill    shell=True
    Log Many    stdout: ${resultado.stdout}    stderr: ${resultado.stderr}
    Log    Fechou o AVD pelo comando 'adb'
    Aguarde "3" segundos

Verificar se o AVD está aberto
    ${output}    Run Process    adb devices    shell=True
    Log Many    ${output.stdout}
    ${emulador_offline}    Set Variable    emulator-5554offline
    ${get_status_output}    Set Variable    ${output.stdout}
    ${get_status_output}    Remove String    ${get_status_output}    ${SPACE}
    IF    $get_status_output == '${emulador_offline}'
        Aguarde "10" segundos
    ELSE
        Aguarde "2" segundos
        Log    AVD encontra-se aberto!
    END
    Should Contain    ${output.stdout}    ${udid}

Instalar o aplicativo
    [Documentation]    Instalar o aplicativo
    ${status_prefixo}    Run keyword and return Status    Verificar o diretorio do .apk e pegar o prefixo
    IF    ${status_prefixo} == True
        Instalar o aplicativo e abrir
        Log    Aplicativo instalado com sucesso!
    ELSE
        Log    Não foi possivel locarlizar o APK no diretório.
    END
    Aguarde "15" segundos
    Close Application

Verificar se o app está instalado
    [Documentation]    Verificar se o app está instalado
    ${comando_adb}    Set Variable    adb shell pm list packages | findstr com.nome.doApp
    ${status_cmd}    Run Process    ${comando_adb}    shell=True
    RETURN    ${status_cmd}

Verificar o diretorio do .apk e pegar o prefixo
    [Documentation]    Verificar o diretorio do apk e pegar o prefixo
    ${arquivos}    List Files In Directory    ${DIRETORIO_APK}
    FOR    ${arquivo}    IN    @{arquivos}
        IF    '${PREFIXO_APP}' in '${arquivo}'
            Set Global Variable    \${global_apk}    ${arquivo}
        END
    END
    Should Not Be Equal As Strings    ${global_apk}    ${EMPTY}    mensagem=APK com prefixo não encontrado
    Log    APK com prefixo encontrado: ${global_apk}

Comparar versões do APK e do aplicativo e instalar
    [Documentation]    Comparar versões do APK e do aplicativo e instalar
    ${versao_app}    Set Variable    com.nome.doApp-${global_versao_app}.apk

    Verificar o diretorio do .apk e pegar o prefixo

    Log    ${global_apk}

    ${condicao}    Run Keyword And Return Status    Should Be Equal As Strings    ${global_apk}    ${versao_app}
    IF    ${condicao} == False
        FOR    ${counter}    IN RANGE    0    4
            Instalar o aplicativo
            Aguarde "2" segundos

            Comando CMD para verificar se o App está instalado e pegar a versão

            ${versao_app}    Set Variable    com.nome.doApp-${global_versao_app}.apk

            ${for_condicao}    Run Keyword And Return Status
            ...    Should Be Equal As Strings
            ...    ${global_apk}
            ...    ${versao_app}

            IF    ${for_condicao} == True    BREAK
        END
    ELSE
        Log    Versão do apk: ${global_apk}, versão do aplicativo instalado: ${versao_app}
    END

Escanear o novo QR Code
    [Documentation]    Escanear o novo QR Code
    ${get_status_img_qrcode}    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    ${QRCODE_TXT_ESCANEIE}
    ...    ${TENTATIVAS_PADRAO}

    IF    ${get_status_img_qrcode} == True
        Wait Until Element Is Visible    ${QRCODE_IMG_LUPA}    ${TENTATIVAS_PADRAO}
        Click Element    ${QRCODE_IMG_LUPA}
        Aguarde "5" segundos
        Verificar se foi apresentado o logo na tela de Login

        Log    Escaneou o QR Code com sucesso!
    ELSE
        Log    Não precisa escanear o QR Code.
    END
