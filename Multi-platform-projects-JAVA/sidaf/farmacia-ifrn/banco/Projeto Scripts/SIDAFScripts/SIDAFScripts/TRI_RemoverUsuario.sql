USE [SIDAF]
GO

CREATE TRIGGER T_RemoverUsuario
ON Cliente
FOR DELETE
AS
  BEGIN
    DELETE FROM	Usuario 
    FROM deleted
    WHERE Usuario.IDLogin = deleted.IDUsuario
    IF @@ERROR <> 0
    BEGIN
      ROLLBACK TRANSACTION
      RAISERROR('Erro de Processamento – Chame o Administrador', 16,1)
      RETURN
    END
  END
