USE [SIDAF]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[atualizarFUNCIONARIO]
	@IDFuncionario int,
	@nome varchar(150),
	@dataNascimento datetime,
	@cpf char(11),
	@rg int,
	@orgaoEmissorRg varchar(10),
	@naturalidade varchar(50),
	@nacionalidade varchar(50),
	@telefoneFixo nchar(10),
	@celular nchar(10),
	@email varchar(50),
	@tipoFuncionario int,
	@isAtivo binary,
	@IDUsuario int,	
	@senha varchar(1000),
	@IDEmpresa int,
	@IDEndereco int,
	@cep int,
	@IDCidade int,
	@logradouro varchar(150),
	@numero int,
	@complemento varchar(20),
	@bairro varchar(100),
	@dataCadastro date	
AS
	BEGIN
	   SET NOCOUNT ON
	   
	   -- INICIANDO A TRANSAÇÃO
	   BEGIN TRANSACTION
	   BEGIN
		UPDATE Funcionario
			SET	nome = @nome
				,dataNascimento = @dataNascimento 
				,cpf = @cpf
				,rg = @rg
				,orgaoEmissorRg = @orgaoEmissorRg
				,naturalidade = @naturalidade
				,nacionalidade = @nacionalidade
				,telefoneFixo = @telefoneFixo
				,celular = @celular
				,email = @email        
				,tipoFuncionario = @tipoFuncionario
				,IDEmpresa = @IDEmpresa
				,dataUltimaAlteracao = @dataCadastro
				,isAtivo = @isAtivo
			WHERE IDFuncionario = @IDFuncionario
        
			DECLARE @IDFunc int = SCOPE_IDENTITY()
        
			UPDATE Usuario
				SET	 login
					,senha = dbo.CriptografaSenha(@senha)
				WHERE IDUsuario = @IDFunc
				
			DECLARE @IDEnd int = SCOPE_IDENTITY()
				
			UPDATE Endereco
				SET  cep = @cep
					,logradouro = @logradouro
					,numero = @numero
					,complemento = @complemento
					,bairro = @bairro
					,IDCidade = @IDCidade
				WHERE IDEndereco = @IDEnd
				IF @@ERROR = 0

				-- FECHA A TRANSAÇÃO 
					COMMIT TRANSACTION
					ELSE

						-- REVERTIMENTO DA TRANSAÇÃO
						ROLLBACK TRANSACTION
					
					END
				END
			