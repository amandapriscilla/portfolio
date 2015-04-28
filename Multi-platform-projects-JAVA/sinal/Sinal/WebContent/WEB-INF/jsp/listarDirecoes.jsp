<%@ page import="java.util.ArrayList, infinith.sinal.modelo.Direcao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="estilo.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SINAL - Rotas Direções</title>
</head>
<body>
<div id="main">
		<jsp:include page="/cabecalho.html" />
		<div id="painelUsuario">
		Bem vindo, <%= session.getAttribute("nome") %>.
		<a href="LogoutServlet">sair</a></div>
		
<div id="tabelaDirecao">
<h2 style="text-align: center">Direções</h2>
			<table align="center" cellspacing="5" cellpadding="5" frame="border">
				<tr>
						<th>Nome</th>
				
				</tr>
				<%ArrayList<Direcao> direcoes = (ArrayList<Direcao>) application.getAttribute("lista");
					if (direcoes.size() > 0) {
						int i=0;
						for (Direcao direcao : direcoes) {
							out.println("<tr>"
										
									+ "</td>" + "<td>" + direcao.getDescricao() + "</td>"
																						
									+ "<td><a href=\"CrudDirecoes?p=excluir&r=" + direcao.getIdDirecao()
									+ "\"><img src=\"delete.gif\" alt=\"Excluir esta rota\" title=\"Excluir esta direção\"/></a> <a href=\"CrudDirecoes?p=editar&r=" + direcao.getIdDirecao()+"\">Editar</a></td>");
						}
						application.removeAttribute("lista");
					} else {
						out.println("Nenhuma direcao cadastrada.");
					}
				%>
			</table>
		</div>
		
		<a href="ComutadorServlet?p=m">Voltar</a>
		
		<div id="rodape"><jsp:include page="/WEB-INF/html/rodape.html" /></div>
	</div>
</body>
</html>