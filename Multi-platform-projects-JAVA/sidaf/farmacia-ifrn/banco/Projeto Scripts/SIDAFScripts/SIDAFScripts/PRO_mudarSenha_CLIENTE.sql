ALTER PROCEDURE [dbo].[mudarSenha] 
	
	@IDUsuario int,
	@login varchar(50),
	@senha varchar(1000)
AS
BEGIN	
	SET NOCOUNT ON;
	    
	UPDATE Usuario
			SET	senha = dbo.CriptografaSenha(@senha)
				WHERE IDLogin = @IDUsuario
				
	IF @@ERROR = 0
		COMMIT TRANSACTION
	ELSE			
		ROLLBACK TRANSACTION		
END

