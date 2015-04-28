<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="sinal.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SINAL - Menu</title>
</head>
<body>
	<div id="main">
		<jsp:include page="/cabecalho.html" />
		
		<div id="painelUsuario">
			Bem vindo, <%=session.getAttribute("nome")%>. <a href="LogoutServlet">sair</a>
		</div>
		
		<jsp:include page="/WEB-INF/html/menu.html"/>
		
		<div id="rodape"><jsp:include page="/WEB-INF/html/rodape.html" /></div>
	</div>
</body>
</html>