<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="iconesinal.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="sinal.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SINAL - Cadastro de Empresas</title>
</head>
<body>
	<div id="main">
		<jsp:include page="/cabecalho.html" />
		<div id="painelUsuario">
		Bem vindo, <%= session.getAttribute("nome") %>.
		<a href="LogoutServlet">sair</a></div>
		
		
		<div id="center" >
		<div id="content" >
			<h2>Cadastrar Empresa</h2>
			
			<form action="CrudEmpresas" method="post">
			<input type="hidden" name="p" value="inserir">
				<table>
					<tr>
						<td>Fantasia</td>
						<td><input type="text" name="fantasia"></input></td>
					</tr>
					<tr>
						<td>Razão Social</td>
						<td><input type="text" name="razao"></input></td>
					</tr>
					<tr>
						<td>CNPJ</td>
						<td><input type="text" name="cnpj"></input></td>
					</tr>
					<tr>
						<td>Insc. Municipal</td>
						<td><input type="text" name="inscMun"></input></td>
					</tr>
					<tr>
						<td>Insc. Estadual</td>
						<td><input type="text" name="inscEst"></input></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" name="ok" value="Cadastrar" />
						</td>
					</tr>
				</table>
			</form>
		</div>
		</div>
		
		<a href="ComutadorServlet?p=m">Voltar</a>
		
		<div id="rodape"><jsp:include page="/WEB-INF/html/rodape.html" /></div>
	</div>

</body>
</html>