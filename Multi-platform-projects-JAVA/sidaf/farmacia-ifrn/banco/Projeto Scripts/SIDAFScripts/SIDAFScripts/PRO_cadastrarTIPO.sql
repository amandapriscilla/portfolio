USE [SIDAF]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE cadastrarTIPO
	@descricao varchar(50)
AS
	INSERT INTO Tipo (descricao) 
	VALUES (@descricao)
GO


