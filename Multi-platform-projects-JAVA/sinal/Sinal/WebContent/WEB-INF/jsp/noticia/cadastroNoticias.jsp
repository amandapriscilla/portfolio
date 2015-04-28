<%@ page import="infinith.sinal.modelo.Noticia"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="estilo.css"/> 
<% Noticia n = (Noticia) application.getAttribute("noticia");
%>
<title><%=(n!=null)?("Editar"):("Cadastrar")%> Noticia</title>
</head>
<body>
<div class="main">
	<jsp:include page="/cabecalho.html" />
	<div id="painelUsuario">
		Bem vindo, <%=session.getAttribute("nome")%>. <a href="LogoutServlet">sair</a>
	</div>
	<jsp:include page="/WEB-INF/html/menu.html"/>

<div id="formCadastroEmpresa" >
<%

	if (n != null){
%>		

<h2>Editar Noticia</h2>
			
			<form action="FrontControllerPrivate" method="post">
			<input type="hidden" name="p" value="ediNotFinal"/>
			<input type="hidden" name="dataCadastro" value="<%=n.getDataCadastro()%>"/>
			<input type="hidden" name="idNoticia" value="<%=n.getIdNoticia()%>"/>
				<table>
					<tr>
						<td>Titulo</td>
						<td><input type="text" name="titulo" value="<%=n.getTitulo()%>"></input></td>
					</tr>
					<tr>
						<td>Descricao</td>
						<td><input type="text" name="descricao" value="<%=n.getDescricao()%>"></input></td>
					</tr>
					<tr>
						<td>Palavras-Chaves</td>
						<td><input type="text" name="palavrasChaves" value="<%=n.getPalavrasChaves()%>"></input></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" name="ok" value="Salvar" />
						</td>
					</tr>
				</table>
			</form>

<%	} else { %>

			<h2>Cadastrar Noticia</h2>
			
			<form action="FrontControllerPrivate" method="post">
			<input type="hidden" name="p" value="cadNotFinal"/>
				<table>
					<tr>
						<td>Titulo</td>
						<td><input type="text" name="titulo"></input></td>
					</tr>
					<tr>
						<td>Descricao</td>
						<td><input type="text" name="descricao"></input></td>
					</tr>
					<tr>
						<td>Palavras-Chaves</td>
						<td><input type="text" name="palavrasChaves"></input></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" name="ok" value="Salvar" />
						</td>
					</tr>
				</table>
			</form>

<%
}
%>	</div>
<div id="rodape"><jsp:include page="/WEB-INF/html/rodape.html" /></div>
</div>

</body>
</html>