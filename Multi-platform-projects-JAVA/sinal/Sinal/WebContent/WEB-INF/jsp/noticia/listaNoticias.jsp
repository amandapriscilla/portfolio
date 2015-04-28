<%@ page import="java.util.ArrayList,infinith.sinal.modelo.Noticia"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="estilo.css"/> 
<title>Lista Noticias</title>
</head>
<body>
<div class="main">
	<jsp:include page="/cabecalho.html" />
		
		<div id="painelUsuario">
			Bem vindo, <%=session.getAttribute("nome")%>. <a href="LogoutServlet">sair</a>
		</div>
	<jsp:include page="/WEB-INF/html/menu.html"/>

<div id="tabelaNoticias">
<h2 style="text-align: center">Noticias Cadastradas</h2>
<table align="center" cellspacing="5" cellpadding="5" >
<tr>
	<th>N.</th>
	<th>Titulo</th>
	<th>Descricao</th>
	<th>Palavras-Chaves</th>
</tr>
<%
	ArrayList<Noticia> noticias = (ArrayList<Noticia>) application.getAttribute("listaNoticias");
	if (noticias != null) {
		int i=1;
		for (Noticia noticia : noticias) {
			out.println("<tr><td>"+ i++
					+ "</td>" + "<td>" + noticia.getTitulo()
					+ "</td>" + "<td>" + noticia.getDescricao() 
					+ "</td>"+ "<td>" + noticia.getPalavrasChaves() 
					+ "</td><td><a href='FrontControllerPrivate?p=delNot&id="
					+ noticia.getIdNoticia()+"'>deletar</a></td><td><a href='FrontControllerPrivate?p=ediNot&id="
					+ noticia.getIdNoticia()+"'>editar</a></td></tr>");
		}
		application.removeAttribute("lista");
	} else {
		out.println("Nenhuma empresa cadastrada.");
	}
%>
</table>
</div>

<div id="rodape"><jsp:include page="/WEB-INF/html/rodape.html" /></div>
</div>
</body>
</html>