*** Settings ***
Documentation       Instalação e abertura do AVD

Resource            ../resources/@main.robot


*** Test Cases ***
Abrir o AVD e atualizar o App
    Abrir o AVD
    Comando CMD para verificar se o App está instalado e pegar a versão
    Comparar versões do APK e do aplicativo e instalar
    Mover o arquivo QRCode.png entre pastas

Ler o QR Code
    [Documentation]
    Abrir App
    Escanear o novo QR Code
    Fechar App