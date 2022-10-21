
INSERT INTO 
	TestDB.dbo.USUARIOS( 
	ID, NOME, DAT_NASCIMENTO, DAT_CRIACAO, DAT_ALTERACAO, DAT_EXCLUSAO, CRIADO_POR_USU_ID, ALTERADO_POR_USU_ID, EXCLUIDO_POR_USU_ID, ID_ATIVO
	)
VALUES
	(1, 'Gerson Batista', '19950327',getdate(),'','','','','',0),
	(2, 'Catarina Luz', '19970521',getdate(),'','','','','',0),
	(3, 'Luis Algusto','19990803',getdate(),'','','','','',0),
	(4, 'Felicia Almeida','19920227',getdate(),'','','','','',0),
	(5, 'Santo Angelo', '20200601',getdate(),'','','','','',0);

	

	INSERT INTO 
	TestDB.dbo.PRODUTOS( 
	ID, NOME, VALOR, DAT_CRIACAO, DAT_ALTERACAO, DAT_EXCLUSAO, CRIADO_POR_USU_ID, ALTERADO_POR_USU_ID, EXCLUIDO_POR_USU_ID, ID_ATIVO
	)
VALUES
	(1, 'Camisa', 50,getdate(),'','','','','',0),
	(2, 'calca jeans', 80,getdate(),'','','','','',0),
	(3, 'tenis', 95,getdate(),'','','','','',0),
	(4, 'bone', 25,getdate(),'','','','','',0),
	(5, 'cazaco', 120,getdate(),'','','','','',0);


	INSERT INTO 
	TestDB.dbo.VENDAS( 
	ID, DAT_CRIACAO, DAT_ALTERACAO, DAT_EXCLUSAO, CRIADO_POR_USU_ID, ALTERADO_POR_USU_ID, EXCLUIDO_POR_USU_ID, ID_ATIVO
	)
VALUES
	(1, getdate(),'','', 1,'','',0),
	(2, getdate(),'','', 1,'','',0),
	(3, getdate(),'','', 3,'','',0),
	(4, getdate(),'','', 2,'','',0),
	(5, getdate(),'','', 5,'','',0);


	INSERT INTO 
	TestDB.dbo.ESTOQUE( 
	ID, ID_PRODUTO, NM_QUANTIDADE, ID_ATIVO
	)
VALUES
	(1, 4, 5, 0),
	(2, 3, 30, 0),
	(3, 1, 3, 0),
	(4, 5, 15, 0),
	(5, 2, 5, 0);


	INSERT INTO 
	TestDB.dbo.VENDAS_PRODUTOS( 
	ID,ID_VENDA, ID_PRODUTO, VALOR, DESCONTO, VALOR_FINAL, DAT_CRIACAO, DAT_ALTERACAO, DAT_EXCLUSAO, CRIADO_POR_USU_ID, ALTERADO_POR_USU_ID, EXCLUIDO_POR_USU_ID, ID_ATIVO
	)
VALUES
	(1,19,1, 50, 10, 50,getdate(),'','','','','',0),
	(2,19,1, 50, 10, 50,getdate(),'','','','','',0),
	(3,19,1, 50, 10, 50,getdate(),'','','','','',0),
	(4,19,1, 50, 10, 50,getdate(),'','','','','',0),
	(5,19,1, 50, 10, 50,getdate(),'','','','','',0);


	INSERT INTO 
	TestDB.dbo.VENDAS( 
	ID, DAT_CRIACAO, DAT_ALTERACAO, DAT_EXCLUSAO, CRIADO_POR_USU_ID, ALTERADO_POR_USU_ID, EXCLUIDO_POR_USU_ID, ID_ATIVO
	)
VALUES
	(13, getdate(),'','', 1,'','',0),
	(2, getdate(),'','', 1,'','',0),
	(3, getdate(),'','', 3,'','',0),
	(4, getdate(),'','', 2,'','',0),
	(5, getdate(),'','', 5,'','',0);
