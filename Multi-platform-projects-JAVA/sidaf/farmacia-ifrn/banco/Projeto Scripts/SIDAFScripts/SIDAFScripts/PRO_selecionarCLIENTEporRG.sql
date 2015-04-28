USE [SIDAF]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE selecionarCLIENTEporRG
	@rg int
AS
	SELECT * FROM [SIDAF].[dbo].[Cliente]
	INNER JOIN Usuario
	on Usuario.IDLogin = Cliente.IDUsuario
	LEFT JOIN Endereco
	on Endereco.IDEndereco = Cliente.IDEndereco
	WHERE rg = @rg
GO

