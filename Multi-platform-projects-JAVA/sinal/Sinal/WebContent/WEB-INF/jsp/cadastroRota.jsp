<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="estilo.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SINAL - Cadastro de Rotas</title>
</head>
<body>
	<div id="main">
		<jsp:include page="/cabecalho.html" />
		<div id="painelUsuario">
		Bem vindo, <%= session.getAttribute("nome") %>.
		<a href="LogoutServlet">sair</a></div>
		
		
		<div id="formCadastroRota" >
			<h2>Cadastro de Rotas</h2>
			
			<form action="CrudRotas" method="post">
				
				<table>
					
					<tr>
						<td>Nome</td>
						<td><input type="hidden" name="p" value="inserir"/>
							<input type="text" name="nome"></input>
						</td>
					</tr>
					<tr>
						<td>Descrição</td>
						<td><input type="text" name="descricao"></input>
						</td>
					</tr>
					<tr>
						<td><input type="submit" name="ok" value="Cadastrar" />
				
						</td>
					</tr>
				</table>
			</form>
				
		</div>
		
		<a href="ComutadorServlet?p=m">Voltar</a>
		
		<div id="rodape"><jsp:include page="/WEB-INF/html/rodape.html" /></div>
	</div>

</body>
</html>