USE [SIDAF]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cadastrarFORNECEDOR]
		
	-- DADOS DO FORNECEDOR
		@nomeFantasia varchar(150),
		@razaoSocial varchar(250),
		@cnpj char(14),
		@ie int,
		@im int,
		@email varchar(50),
		@telefone nchar(10),
		@fax nchar(10),
		@url varchar(50),
		
	-- DADOS DO ENDEREÇO
		@logradouro varchar(150),
		@numero int,
		@complemento varchar(20),
		@bairro varchar(100),
		@cep int,
		@IDCidade int
AS
	BEGIN
	   SET NOCOUNT ON
	
	-- INICIANDO A TRANSAÇÃO
		BEGIN TRANSACTION
			BEGIN
		
			-- INSERINDO ENDEREÇO
				INSERT INTO Endereco (logradouro
									 ,numero
									 ,complemento
									 ,bairro
									 ,cep
									 ,IDCidade)
				VALUES(@logradouro
					  ,@numero
					  ,@complemento
					  ,@bairro
					  ,@cep
					  ,@IDCidade)
					  
			-- DECLARA A VARIÁVEL PARA RECUPERAR O ÚLTIMO IDENDERECO
				DECLARE @IDEndereco int = SCOPE_IDENTITY()
			
			-- INSERINDO FUNCIONÁRIO
				INSERT INTO Fornecedor	(nomeFantasia
										,razaoSocial
										,cnpj
										,ie
										,im
										,email
										,telefone
										,fax
										,url
										,IDEndereco)
				VALUES (@nomeFantasia
				       ,@razaoSocial
					   ,@cnpj
					   ,@ie
					   ,@im
					   ,@email
					   ,@telefone
					   ,@fax
					   ,@url
					   ,@IDEndereco)
       					
			-- VERIFICANDO SE OCORREU ALGUM ERRO
				IF @@ERROR = 0

			-- FECHA A TRANSAÇÃO 
					COMMIT TRANSACTION
				ELSE

			-- REVERTIMENTO DA TRANSAÇÃO
					ROLLBACK TRANSACTION
		END
	END
