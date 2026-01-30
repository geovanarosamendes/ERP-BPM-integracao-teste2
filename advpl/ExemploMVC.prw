# INCLUDE "PROTHEUS.CH"
# INCLUDE "FWMBROWSE.CH"

User Function ExemploMVC()
local oBrowse

//Criação do objeto do tipo Browse
oBrowse := FwmBrowse(0: NEW

//Definir qual a tabela que será apresentada no browse
oBrowse: SetAlias('SB1')

//Definir o título ou a descrição que será apresentada no browse
oBrowse: SetDescription("Cadastro de Produto")

//Realiza a ativação do Browse
oBrowse: Activate()


//Ler os dados da tabela

DbSelectArea('SB1')
DbGoTop()
While !Eof()
    cCodigo := Field->Codigo
    cDescricao := Field->Descricao

    // Adiciona registro aao Browse (Controller + View)
    oBrowse:AddRecord(cCodigo, cDescricao)

    DbSkip()
EndDo

RETURN