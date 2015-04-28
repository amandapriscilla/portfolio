USE [SIDAF]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE cadastrarESTORNO
	@IDFuncionario int,
	@IDCaixa int,
	@IDCliente int
	
AS
	INSERT INTO [SIDAF].[dbo].[Estorno]
		       ([IDFuncionario]
	           ,[IDCaixa]
		       ,[IDCliente])
     VALUES
           (@IDFuncionario
           ,@IDCaixa
           ,@IDCliente)
GO


GO