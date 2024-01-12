*** Variables ***
${platformName}                 Android
${platformVersion}              11.0
${deviceName}                   Mobile_Automacao
${avd}                          Mobile_Automacao
${udid}                         emulator-5554
${appPackage}                   com.nome.doApp
${appActivity}                  xxxxxxxxxxxxxxxxx.SplashScreen
${automationName}               UiAutomator2

${QRCODE_ORIGEM}                C:\\Users\\henrique.justino\\imagens
${QRCODE_DESTINO}               C:\\Users\\${global_usuario_windows}\\AppData\\Local\\Android\\Sdk\\emulator\\resources
${QRCODE_ARQUIVO}               QRCode.png

${TENTATIVAS_MINIMA}            7
${TENTATIVAS_PADRAO}            20
${TENTATIVAS_MAXIMA}            55

# Variáveis de controle global
${global_usuario_windows}       ${EMPTY}
${global_versao_app}            ${EMPTY}

### KEY EVENTS
${ENTER}                        66
${BACKSPACE}                    105
