<%@ page import="java.util.ArrayList, infinith.sinal.modelo.Veiculo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="estilo.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SINAL - Veículos Cadastrados</title>
</head>
<body>
<div id="main">
		<jsp:include page="/cabecalho.html" />
		<div id="painelUsuario">
		Bem vindo, <%= session.getAttribute("nome") %>.
		<a href="LogoutServlet">sair</a></div>
		
		
		
<div id="tabelaVeiculos">
<h2 style="text-align: center">Veículos Cadastrados</h2>
			<table align="center" cellspacing="5" cellpadding="5" frame="border">
				<tr>
						<th>Número</th>
						<th>Marca</th>
						<th>Tipo</th>
						<th>Modelo</th>
						<th>Placa</th>
						<th>Renavan</th>
						<th>Cor</th>
						<th>Ano</th>
						<th>Combustivel</th>
				</tr>
				<%ArrayList<Veiculo> veiculos = (ArrayList<Veiculo>) application.getAttribute("lista");
					if (veiculos.size() > 0) {
						int i=0;
						for (Veiculo veiculo : veiculos) {
							out.println("<tr>"
										
									+ "</td>" + "<td>" + veiculo.getNumero() + "</td>"
									+ "</td>" + "<td>" + veiculo.getMarca() + "</td>"
									+ "</td>" + "<td>" + veiculo.getTipo() + "</td>"
									+ "</td>" + "<td>" + veiculo.getModelo() + "</td>"
									+ "</td>" + "<td>" + veiculo.getPlaca() + "</td>"
									+ "</td>" + "<td>" + veiculo.getRenavan() + "</td>"
									+ "</td>" + "<td>" + veiculo.getCor() + "</td>"
									+ "</td>" + "<td>" + veiculo.getAno() + "</td>"
									+ "</td>" + "<td>" + veiculo.getCombustivel() + "</td>"
									
									
									+ "<td><a href=\"CrudVeiculos?p=excluir&r=" + veiculo.getIdVeiculo()
									+ "\"><img src=\"delete.gif\" alt=\"Excluir esta veículo\" title=\"Excluir esta veículo\"/></a> <a href=\"CrudVeiculos?p=editar&r=" + veiculo.getIdVeiculo()+"\">Editar</a></td>");
						}
						application.removeAttribute("lista");
					} else {
						out.println("Nenhum veículo cadastrado.");
					}
				%>
			</table>
		</div>
		
		<a href="ComutadorServlet?p=m">Voltar</a>
		
		<div id="rodape"><jsp:include page="/WEB-INF/html/rodape.html" /></div>
	</div>
</body>
</html>