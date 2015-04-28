<%@ page import="java.util.ArrayList,infinith.sinal.modelo.Empresa"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="iconesinal.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="sinal.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SINAL - Empresas Cadastradas</title>
</head>
<body>
	<div id="main">
		<jsp:include page="/cabecalho.html" />
		<div id="painelUsuario">
			Bem vindo,
			<%= session.getAttribute("nome") %>. <a href="LogoutServlet">sair</a>
		</div>		

		<div id="tabelaEmpresas">
			<h2 style="text-align: center">Empresas Cadastradas</h2>
			<table align="center" cellspacing="10" cellpadding="10" frame="border">
				<tr>
					<th>N.</th>
					<th>Fantasia</th>
					<th>Razão</th>
					<th>CNPJ</th>
					<th>Insc. Mun.</th>
					<th>Insc. Est.</th>
					<th>Opções</th>
				</tr>
				<%
					ArrayList<Empresa> empresas = (ArrayList<Empresa>) application.getAttribute("lista");
					if (empresas.size() > 0) {
						int i=0;
						for (Empresa empresa : empresas) {
							out.println("<tr><td>" + ++i +"</td><td>"+ empresa.getNomeFantasia()
									+ "</td><td>" + empresa.getRazaoSocial()
									+ "</td><td>" + empresa.getCnpj() + "</td>"
									+ "<td>" + empresa.getInscMunicipal() + "</td>"
									+ "<td>" + empresa.getInscEstadual() + "</td><td>"
									+ "<a href=\"CrudEmpresas?p=editar&r=" + empresa.getIdEmpresa()
									+ "\"><img src=\"edit.png\" alt=\"Alterar este cadastro\" title=\"Alterar este cadastro\"/></a> "
									+ "<a href=\"CrudEmpresas?p=excluir&r=" + empresa.getIdEmpresa()
									+ "\"><img src=\"delete.gif\" alt=\"Excluir esta empresa\" title=\"Excluir esta empresa\"/></a> "
									+ "</td>");
						}
						application.removeAttribute("lista");
					} else {
						out.println("Nenhuma empresa cadastrada.");
					}
				%>
			</table>
		</div>

		<a href="ComutadorServlet?p=m">Voltar</a>

		<div id="rodape"><jsp:include page="/rodape.html" /></div>
	</div>
</body>
</html>