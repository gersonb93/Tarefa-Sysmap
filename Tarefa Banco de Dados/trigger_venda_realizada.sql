
CREATE TRIGGER [envia_email_venda_realizada]

ON [TestDB].[dbo].[vendas]

AFTER INSERT, UPDATE

AS

begin

DECLARE @ID INT, @DAT_CRIACAO DATETIME, @DAT_ALTERACAO DATETIME, @DAT_EXCLUSAO DATETIME, 
@CRIADO_POR_USU_ID INT, @ALTERADO_POR_USU_ID INT, @EXCLUIDO_POR_USU_ID INT, @ID_ATIVO INT


SELECT @ID = ID, @DAT_CRIACAO = DAT_CRIACAO, @DAT_ALTERACAO = DAT_ALTERACAO,@DAT_EXCLUSAO = DAT_EXCLUSAO, 
@CRIADO_POR_USU_ID = CRIADO_POR_USU_ID, @ALTERADO_POR_USU_ID = ALTERADO_POR_USU_ID,@EXCLUIDO_POR_USU_ID = EXCLUIDO_POR_USU_ID, @ID_ATIVO = ID_ATIVO

FROM INSERTED


DECLARE @varbody VARCHAR(100)

SET @varbody = 'Foi Realizada uma venda'


EXEC msdb.dbo.sp_send_dbmail

@profile_name = 'SqlFromHell',

@recipients = 'bgerson003@gmail.com',

@body = @varbody,

--@query =

@subject = 'Nova Venda Realizada'

--@attach_query_result_as_file = 0;

end


DROP TRIGGER [envia_email_venda_realizada]

