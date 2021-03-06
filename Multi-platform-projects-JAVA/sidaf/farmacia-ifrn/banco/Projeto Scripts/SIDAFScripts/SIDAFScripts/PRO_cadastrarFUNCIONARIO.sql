USE [SIDAF]
GO
/****** Object:  StoredProcedure [dbo].[cadastrarFUNCIONARIO]    Script Date: 03/14/2010 23:29:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[cadastrarFUNCIONARIO]
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
	@login varchar(50),
	@senha varchar(1000),
	@IDEmpresa int,
	@cep int,
	@IDCidade int,
	@logradouro varchar(150),
	@numero int,
	@complemento varchar(20),
	@bairro varchar(100)	
AS
	BEGIN
	   SET NOCOUNT ON
	
	-- INICIANDO A TRANSAÇÃO
	   BEGIN TRANSACTION
			BEGIN
			-- INSERINDO USUÁRIO
				INSERT INTO Usuario	(login, senha)
				VALUES (@login, dbo.CriptografaSenha(@senha))
			
			-- DECLARA A VARIÁVEL PARA RECUPERAR O ÚLTIMO IDUSUARIO
				DECLARE @IDUsuario int = SCOPE_IDENTITY()
			
			-- INSERINDO ENDEREÇO
				INSERT INTO Endereco (logradouro
									 ,numero
									 ,complemento
									 ,cep
									 ,IDCidade
									 ,bairro)
				VALUES(@logradouro
					  ,@numero
					  ,@complemento
					  ,@cep
					  ,@IDCidade
					  ,@bairro)
					  
			-- DECLARA A VARIÁVEL PARA RECUPERAR O ULTIMO IDENDERECO
				DECLARE @IDEndereco int = SCOPE_IDENTITY()
			
			-- INSERINDO FUNCIONÁRIO
				INSERT INTO Funcionario (nome
										,dataNascimento
										,cpf
										,rg
										,orgaoEmissorRg
										,naturalidade
										,nacionalidade
										,telefoneFixo
										,celular
										,email
										,tipoFuncionario
										,isAtivo
										,IDEndereco
										,IDUsuario
										,IDEmpresa)
				VALUES (@nome
				       ,@dataNascimento
					   ,@cpf
					   ,@rg
					   ,@orgaoEmissorRg
					   ,@naturalidade
					   ,@nacionalidade
					   ,@telefoneFixo
					   ,@celular
					   ,@email
					   ,@tipoFuncionario
					   ,1
					   ,@IDEndereco
					   ,@IDUsuario
					   ,@IDEmpresa)
       					
			-- VERIFICANDO SE OCORREU ALGUM ERRO
				IF @@ERROR = 0

				-- FECHA A TRANSAÇÃO 
					COMMIT TRANSACTION
				ELSE

				-- REVERTIMENTO DA TRANSAÇÃO
					ROLLBACK TRANSACTION
		END
	END
