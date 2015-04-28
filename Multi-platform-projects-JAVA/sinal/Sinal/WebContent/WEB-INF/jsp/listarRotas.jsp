<%@ page import="java.util.ArrayList, infinith.sinal.modelo.Rota"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="estilo.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SINAL - Rotas Cadastradas</title>
</head>
<body>
<div id="main">
		<jsp:include page="/cabecalho.html" />
		<div id="painelUsuario">
		Bem vindo, <%= session.getAttribute("nome") %>.
		<a href="LogoutServlet">sair</a></div>
		
		
		
<div id="tabelaRotas">
<h2 style="text-align: center">Rotas Cadastradas</h2>
			<table align="center" cellspacing="5" cellpadding="5" frame="border">
				<tr>
						<th>Nome</th>
						<th>Descrição</th>
				</tr>
				<%ArrayList<Rota> rotas = (ArrayList<Rota>) application.getAttribute("lista");
					if (rotas.size() > 0) {
						int i=0;
						for (Rota rota : rotas) {
							out.println("<tr>"
										
									+ "</td>" + "<td>" + rota.getNome() + "</td>"
									+ "</td>" + "<td>" + rota.getDescricao() + "</td>"
																
									+ "<td><a href=\"CrudRotas?p=excluir&r=" + rota.getIdRota()
									+ "\"><img src=\"delete.gif\" alt=\"Excluir esta rota\" title=\"Excluir esta rota\"/></a> <a href=\"CrudRotas?p=editar&r=" + rota.getIdRota()+"\">Editar</a></td>");
						}
						application.removeAttribute("lista");
					} else {
						out.println("Nenhuma rota cadastrada.");
					}
				%>
			</table>
		</div>
		
		<a href="ComutadorServlet?p=m">Voltar</a>
		
		<div id="rodape"><jsp:include page="/WEB-INF/html/rodape.html" /></div>
	</div>
</body>
</html>