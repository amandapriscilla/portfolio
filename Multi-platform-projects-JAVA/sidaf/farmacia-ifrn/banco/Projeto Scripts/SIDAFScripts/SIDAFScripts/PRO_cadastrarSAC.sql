USE [SIDAF]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE cadastrarSAC
	@nome varchar(50),
	@assunto varchar(150),
	@email varchar(150),
	@telefone varchar(10),
	@mensagem varchar(MAX),
	@IDEmpresa int
AS
	INSERT INTO [SIDAF].[dbo].[SAC]
		       ([nome]
	           ,[assunto]
		       ,[email]
			   ,[telefone]
			   ,[mensagem]
			   ,[IDEmpresa])
     VALUES
           (@nome
           ,@assunto
           ,@email
           ,@telefone
           ,@mensagem
           ,@IDEmpresa)
GO


GO


