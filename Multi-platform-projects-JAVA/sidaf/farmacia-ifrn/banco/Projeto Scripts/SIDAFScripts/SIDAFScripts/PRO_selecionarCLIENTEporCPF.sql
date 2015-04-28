USE [SIDAF]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[selecionarCLIENTEporCPF]
	@cpf char
AS
<<<<<<< .mine
	SELECT c.nome, c.dataNasciment, c.cpf, c.rg, c.orgaoEmissor, c.naturalidade, c.nacionalidade,
	c.telefoneFixo, c.celular, c.email, c.dataCadastro, c.dataUltimaAlteracao, e.logradouro, e.numero, e.complemento,
	e.cep, e.bairro, cid.Cidade, est.Sigla, est.Estado FROM (((Cliente AS c INNER JOIN Endereco AS e ON
	c.IDendereco = e.IDEndereco)FROM Cidade AS cid ON e.IDCidade = cid.IDCidade) 
	FROM Estado AS est ON cid.IDEstado = est.IDEstado) WHERE c.cpf = @cpf GROUP BY c.nome, c.dataNasciment, c.cpf, 
	c.rg, c.orgaoEmissor, c.naturalidade, c.nacionalidade, c.telefoneFixo, c.celular, c.email, c.dataCadastro, 
	c.dataUltimaAlteracao, e.logradouro, e.numero, e.complemento, e.cep, e.bairro, cid.Cidade, est.Sigla, est.Estado
GO



=======
	SELECT * FROM [SIDAF].[dbo].[Cliente]
	INNER JOIN Usuario
	on Usuario.IDLogin = Cliente.IDUsuario
	LEFT JOIN Endereco
	on Endereco.IDEndereco = Cliente.IDEndereco
	WHERE cpf = @cpf
GO>>>>>>> .r154
