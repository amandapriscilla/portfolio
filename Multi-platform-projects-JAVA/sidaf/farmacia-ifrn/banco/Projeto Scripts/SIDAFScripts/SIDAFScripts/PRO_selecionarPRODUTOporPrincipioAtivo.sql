USE [SIDAF]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE selecionarPRODUTOporPrincipioAtivo
	@princ int
AS
	SELECT * FROM Produto
	WHERE princAtivo like '%'+@princ+'%'
GO


