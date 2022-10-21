CREATE PROCEDURE Produtos_Em_Estoque
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
    </tr>' +  
    CAST ( 
    (
		select 
		td = p.ID, '', 
		td = p.NOME,'', 
		td = p.VALOR,'', 
		td = e.NM_QUANTIDADE,''
       from PRODUTOS p 
       join ESTOQUE e on p.ID = e.ID_PRODUTO
        where p.ID_ATIVO = 0
		
        FOR XML PATH('tr'), TYPE
    ) AS NVARCHAR(MAX) ) + '
</table>';


-- Envia o e-mail
EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'SqlFromHell', -- sysname
    @recipients = 'bgerson003@gmail.com', -- varchar(max)
    @subject = N'Teste', -- nvarchar(255)
    @body = @HTML, -- nvarchar(max)
    @body_format = 'html'

