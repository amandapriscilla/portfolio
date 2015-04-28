USE [SIDAF]
GO

<<<<<<< .mine
CREATE TRIGGER T_RemoverEndereco
ON Cliente
FOR DELETE
=======
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[excluirCLIENTE]
	@IDCliente int,
	@IDUsuario int,
	@IDEndereco int
>>>>>>> .r140
AS
<<<<<<< .mine
  BEGIN
    DELETE FROM Endereco 
    FROM deleted
    WHERE Endereco.IDEndereco = deleted.IDEndereco
    IF @@ERROR <> 0
    BEGIN
      ROLLBACK TRANSACTION
      RAISERROR('Erro de Processamento – Chame o Administrador', 16,1)
      RETURN
    END
  END
=======
	DELETE FROM Endereco
	WHERE IDEndereco = @IDEndereco
	
	DELETE FROM Usuario
	WHERE IDUsuario = @IDUsuario
	
	DELETE FROM Cliente
	WHERE IDCliente = @IDCliente
GO

>>>>>>> .r140
