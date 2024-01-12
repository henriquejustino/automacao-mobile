*** Settings ***
Library     AppiumLibrary
Library     DateTime
Library     String
Library     Process
Library     Collections
Library     XML
Library     RequestsLibrary
Library     OperatingSystem
Library     DatabaseLibrary

### DATA ###
Resource    ./data/variables/config.resource

### DATABASE ###
Resource    ./database/banco_app.robot

### SHARED ###
Resource    ./shared/@main_keywords.robot

### SCREENS ###
Resource    ./screens/login.robot
Resource    ./screens/tela_principal.robot
Resource    ./screens/carrinho.robot
Resource    ./screens/desconto.robot
Resource    ./screens/consultar_produtos.robot

### POP-UP ###
Resource    ./screens/popup.robot