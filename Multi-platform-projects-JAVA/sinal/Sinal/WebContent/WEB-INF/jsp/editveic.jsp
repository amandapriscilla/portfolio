<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="infinith.sinal.modelo.Veiculo,java.lang.String"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="estilo.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SINAL - Editar Veículo</title>
</head>
<body>
	<div id="main">
		<jsp:include page="/cabecalho.html" />
		<div id="painelUsuario">
			Bem vindo,
			<%=session.getAttribute("nome")%>. <a href="LogoutServlet">sair</a>
		</div>


		<div id="formCadastroVeiculo">
			<h2>Editar Veículo</h2>



			<form action="CrudVeiculos" method="post">
				<%Veiculo selectedveic = (Veiculo) request.getAttribute("selectedveic");%>

				<table>
					<tr>
						<td>Marca</td>
						<td>
						<input type="hidden" name="p" value="alterar"/>
						<input type="hidden" name="id" value="<%= selectedveic.getIdVeiculo()%>"/>
						<input type="text" name="marca" value="<%=selectedveic.getMarca()%>"></input>
						</td>
					</tr>
					<tr>
						<td>Tipo</td>
						<td><input type="text" name="tipo"
							value="<%=selectedveic.getTipo()%>"></input>
						</td>
					</tr>
					<tr>
						<td>Modelo</td>
						<td><input type="text" name="modelo"
							value="<%=selectedveic.getModelo()%>"></input>
						</td>
					</tr>
					<tr>
						<td>Placa</td>
						<td><input type="text" name="placa"
							value="<%=selectedveic.getPlaca()%>"></input>
						</td>
					</tr>
					<tr>
						<td>Renavan</td>
						<td><input type="text" name="renavan"
							value="<%=selectedveic.getRenavan()%>"></input>
						</td>
					</tr>
					<tr>
						<td>Cor</td>
						<td><input type="text" name="cor"
							value="<%=selectedveic.getCor()%>"></input>
						</td>
					</tr>
					<tr>
						<td>Ano</td>
						<td><input type="text" name="ano"
							value="<%=selectedveic.getAno()%>"></input>
						</td>
					</tr>
					<tr>
						<td>Combustivel</td>
						<td><input type="text" name="combustivel"
							value="<%=selectedveic.getCombustivel()%>"></input>
						</td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" name="ok" value="Editar" /></td>
					</tr>
				</table>
			</form>



		</div>

		<a href="ComutadorServlet?p=m">Voltar</a>

		<div id="rodape"><jsp:include page="/WEB-INF/html/rodape.html" /></div>
	</div>

</body>
</html>