USE [SIDAF]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE atualizarTIPO
	@IDTipo int,
	@descricao varchar(50)
AS
	UPDATE [SIDAF].[dbo].[Tipo]
	SET [descricao] = @descricao
	WHERE IDTipo = @IDTipo
GO


