<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="estilo.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SINAL - Cadastro de Veículos</title>
</head>
<body>
	<div id="main">
		<jsp:include page="/cabecalho.html" />
		<div id="painelUsuario">
		Bem vindo, <%= session.getAttribute("nome") %>.
		<a href="LogoutServlet">sair</a></div>
		
		
		<div id="formCadastroVeiculo" >
			<h2>Cadastro de Veículos</h2>
			
			
		
			<form action="CrudVeiculos" method="post">
				
				<table>
				
				
					<tr>
						<td>Número</td>
						<td><input type="hidden" name="p" value="inserir"/>
							<input type="text" name="numero"></input>
						</td>
					</tr>
					<tr>
						<td>Marca</td>
						<td><input type="text" name="marca"></input>
						</td>
					</tr>
					<tr>
						<td>Tipo</td>
						<td><input type="text" name="tipo"></input>
						</td>
					</tr>
					<tr>
						<td>Modelo</td>
						<td><input type="text" name="modelo"></input>
						</td>
					</tr>
					<tr>
						<td>Placa</td>
						<td><input type="text" name="placa"></input>
						</td>
					</tr>
					<tr>
						<td>Renavan</td>
						<td><input type="text" name="renavan"></input>
						</td>
					</tr>
					<tr>
						<td>Cor</td>
						<td><input type="text" name="cor"></input>
						</td>
					</tr>
					<tr>
						<td>Ano</td>
						<td><input type="text" name="ano"></input>
						</td>
					</tr>
					<tr>
						<td>Combustivel</td>
						<td><input type="text" name="combustivel"></input>
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