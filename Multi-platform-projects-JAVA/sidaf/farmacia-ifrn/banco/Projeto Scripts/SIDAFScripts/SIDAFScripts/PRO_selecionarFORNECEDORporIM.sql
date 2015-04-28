USE [SIDAF]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[selecionarFORNECEDORporIM]
	-- INFORMA��O DO FORNECEDOR
		@im char
AS
	-- SELECIONANDO O(S) FORNECEDOR(ES) PELO IM
		SELECT * FROM [SIDAF].[dbo].[Fornecedor]
		WHERE im = @im