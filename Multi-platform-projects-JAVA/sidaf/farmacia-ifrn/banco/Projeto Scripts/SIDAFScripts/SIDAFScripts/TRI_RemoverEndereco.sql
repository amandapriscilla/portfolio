USE [SIDAF]
GO

CREATE TRIGGER T_Endereco
ON Cliente
FOR DELETE
AS
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
