

CREATE PROCEDURE Produtos_3_mais_vendidos  @DT_INICIAL DATETIME, @DT_FINAL DATETIME
AS

-- Transforma o conteúdo da query em HTML
DECLARE @HTML VARCHAR(MAX);  


SET @HTML = '
<h1>Todos Produtos e seu Estoque</h1>
<table border="1">
    <tr>
        <th>Codigo</th>
        <th>Nome</th>
        <th>Valor</th>
		<th>Estoque</th>
		<th>Vendidos</th>
    </tr>' +  
    CAST ( 
    (
		select 
		td = p.ID, '', 
		td = p.NOME,'', 
		td = p.VALOR,'', 
		td = e.NM_QUANTIDADE,'',
		td = COUNT(VP.ID_PRODUTO),''

       from PRODUTOS p 
       join ESTOQUE e on p.ID = e.ID_PRODUTO
	   join vendas_produtos vp on vp.ID_PRODUTO = e.ID_PRODUTO
       where VP.DAT_CRIACAO between @DT_INICIAL and  @DT_FINAL 
	   GROUP BY p.ID,p.NOME,p.VALOR,e.NM_QUANTIDADE
	   ORDER BY COUNT(VP.ID_PRODUTO) DESC
        FOR XML PATH('tr'), TYPE
    ) AS NVARCHAR(MAX) ) + '
</table>';


-- Envia o e-mail
EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'SqlFromHell', -- sysname
    @recipients = 'contato@sysmap.com.br', -- varchar(max)
    @subject = N'Teste', -- nvarchar(255)
    @body = @HTML, -- nvarchar(max)
    @body_format = 'html'


	EXECUTE Produtos_3_mais_vendidos @DT_INICIAL = '2022-10-01 00:00', @DT_FINAL = '2022-10-20 23:59';

	