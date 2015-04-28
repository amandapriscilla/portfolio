<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="infinith.sinal.modelo.Direcao,java.lang.String"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="estilo.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SINAL - Editar Direcao</title>
</head>
<body>
	<div id="main">
		<jsp:include page="/cabecalho.html" />
		<div id="painelUsuario">
			Bem vindo,
			<%=session.getAttribute("nome")%>. <a href="LogoutServlet">sair</a>
		</div>


		<div id="formCadastroDirecao">
			<h2>Editar Direcao</h2>



			<form action="CrudDirecao" method="post">
				<%Direcao selectedDirecao = (Direcao) request.getAttribute("selectedDirecao");%>

				<table>
					<tr>
						<td>Nome</td>
						<td>
						<input type="hidden" name="p" value="alterar"/>
						<input type="hidden" name="id" value="<%= selectedDirecao.getIdDirecao()%>"/>
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