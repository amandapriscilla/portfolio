USE [SIDAF]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE excluirFUNCIONARIO
	@IDFunc int,
	@IDUsuario int,
	@IDEndereco int
AS

	DELETE FROM Endereco
	WHERE IDEndereco = @IDEndereco
	
	DELETE FROM Usuario
	WHERE IDUsuario = @IDUsuario
	
	DELETE FROM Funcionario
	WHERE IDFuncionario = @IDFunc
GO

