CREATE TRIGGER [envia_email_quantidade_estoque_menor_3]

ON [TestDB].[dbo].[vendas_produtos]

AFTER INSERT, UPDATE

AS

begin

DECLARE @nm_quantidade INT, @ID_PRODUTO INT, @ID_VENDA INT, @DATA_VENDA DATETIME, @VALOR DECIMAL, @VALOR_FINAL DECIMAL, @calculo numeric(10,2)


SELECT @ID_PRODUTO = ID_PRODUTO, @ID_VENDA = ID_VENDA, @DATA_VENDA = DAT_CRIACAO, @calculo = VALOR * DESCONTO/100

FROM INSERTED

UPDATE ESTOQUE 
    SET NM_QUANTIDADE = NM_QUANTIDADE - 1
	WHERE ID_PRODUTO = @ID_PRODUTO

INSERT INTO VENDAS(ID, DAT_CRIACAO, DAT_ALTERACAO, DAT_EXCLUSAO, CRIADO_POR_USU_ID, ALTERADO_POR_USU_ID, EXCLUIDO_POR_USU_ID, ID_ATIVO) 
VALUES (NEXT VALUE FOR seq_VENDAS, @DATA_VENDA,'','', 1,'','',0)

UPDATE VENDAS_PRODUTOS 
    SET ID_VENDA = @ID_VENDA,
	VALOR_FINAL =  VALOR - @calculo 
	WHERE ID_PRODUTO = @ID_PRODUTO

DECLARE @varbody VARCHAR(100)
DECLARE @Produto VARCHAR(50)

select @Produto = (select NOME from PRODUTOS WHERE @ID_PRODUTO = ID)

SET @varbody = 'A Quantidade do Produto' + @Produto + 'em estoque é menor que 3'


select @nm_quantidade = (select NM_QUANTIDADE from ESTOQUE WHERE NM_QUANTIDADE < 3)

IF @nm_quantidade < 3

EXEC msdb.dbo.sp_send_dbmail

@profile_name = 'SqlFromHell',

@recipients = 'bgerson003@gmail.com',

@body = @varbody,

--@query =

@subject = 'Nova Solicitação de Venda'

--@attach_query_result_as_file = 0;

end


DROP TRIGGER [envia_email_quantidade_estoque_menor_3]

