*** Settings ***
Library         OperatingSystem
Library         BuiltIn
Library         String

*** Variables ***
${PATH}         ${CURDIR}/texto.txt
${texto}        Trabalho GCS\nRobot FrameWork

*** Test Cases ***
Criar arquivo com texto
    Create File    ${PATH}  ${texto}

Mostra a PATH
    Log To Console  ${PATH}

lenght por linhas do arquivo
    ${contents}=  Get File  ${PATH} 
    @{list}  Split to lines  ${contents}     
    FOR    ${line}  IN  @{list}
        Get Length  ${line}
    END

Teste se texto existe
    File Should Exist    ${PATH}

Teste se texto não esta vazio
    File Should Not Be Empty    ${PATH}



