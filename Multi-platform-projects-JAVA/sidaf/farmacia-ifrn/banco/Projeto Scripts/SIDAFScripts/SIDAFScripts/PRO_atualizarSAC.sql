USE [SIDAF]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE atualizarSAC
	@IDSAC int,
	@nome varchar(50),
	@assunto varchar(150),
	@email varchar(150),
	@telefone varchar(10),
	@mensagem varchar(MAX),
	@IDEmpresa int
AS
	UPDATE [SIDAF].[dbo].[SAC]
	SET [IDEmpresa] = @IDEmpresa
	   ,[nome] = @nome
       ,[assunto] = @assunto
       ,[email] = @email
       ,[telefone] = @telefone
       ,[mensagem] = @mensagem
	WHERE IDEmpresa = IDEmpresa
GO