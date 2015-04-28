<%@ page import="java.util.ArrayList,infinith.sinal.modelo.Georeferencia"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="iconesinal.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="sinal.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SINAL - Paradas Cadastradas</title>
</head>
<body>
	<div id="main">
		<jsp:include page="/cabecalho.html" />
		<div id="painelUsuario">
			Bem vindo,
			<%= session.getAttribute("nome") %>. <a href="LogoutServlet">sair</a>
		</div>		
		
		<a href="ComutadorServlet?p=cadgeo" ><img src="images/novo.png" alt="Cadastrar nova parada" title="Cadastrar nova parada" /></a>
		
		<div id="tabelaEmpresas">
			<h2 style="text-align: center">Paradas Cadastradas</h2>
			<table align="center" cellspacing="10" cellpadding="10" frame="border">
				<tr>
					<th>N.</th>
					<th>Código</th>
					<th>Descrição</th>
					<th>Latitude</th>
					<th>Longitude</th>
					<th>Importante</th>
					<th>Opções</th>
				</tr>
				<%
					String checado = "";
					ArrayList<Georeferencia> paradas = (ArrayList<Georeferencia>) application.getAttribute("lista");
					if (paradas.size() > 0) {
						int i=0;
						for (Georeferencia parada : paradas)
						{
							checado = (parada.isImportancia()) ? " checked=\"checked\" " : " ";
							out.println("<tr><td>" + ++i +"</td><td>"+ parada.getCodigo()
									+ "</td><td>" + parada.getDescricao()
									+ "</td><td>" + parada.getLatitude() + "</td>"
									+ "<td>" + parada.getLongitude() + "</td>"
									+ "<td><input type=\"checkbox\"" + checado + "disabled=\"true\" /></td><td>"
									+ "<a href=\"CrudGeoreferencias?p=editar&r=" + parada.getIdGeoreferencia()
									+ "\"><img src=\"edit.png\" alt=\"Alterar este cadastro\" title=\"Alterar este cadastro\"/></a> "
									+ "<a href=\"CrudGeoreferencias?p=excluir&r=" + parada.getIdGeoreferencia()
									+ "\"><img src=\"delete.gif\" alt=\"Excluir esta empresa\" title=\"Excluir esta parada\"/></a> "
									+ "</td>");
						}
						application.removeAttribute("lista");
					} else {
						out.println("Nenhuma parada cadastrada.");
					}
				%>
			</table>
		</div>

		<a href="ComutadorServlet?p=m">Voltar</a>

		<div id="rodape"><jsp:include page="/rodape.html" /></div>
	</div>
</body>
</html>