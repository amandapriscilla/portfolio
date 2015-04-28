<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="infinith.sinal.modelo.Rota,java.lang.String"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="estilo.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SINAL - Editar Rota</title>
</head>
<body>
	<div id="main">
		<jsp:include page="/cabecalho.html" />
		<div id="painelUsuario">
			Bem vindo,
			<%=session.getAttribute("nome")%>. <a href="LogoutServlet">sair</a>
		</div>


		<div id="formCadastroRota">
			<h2>Editar Rota</h2>



			<form action="CrudRotas" method="post">
				<%Rota selectedRota = (Rota) request.getAttribute("selectedRota");%>

				<table>
					<tr>
						<td>Nome</td>
						<td>
						<input type="hidden" name="p" value="alterar"/>
						<input type="hidden" name="id" value="<%= selectedRota.getIdRota()%>"/>
						<input type="text" name="nome" value="<%=selectedRota.getNome()%>"></input>
						</td>
					</tr>
					<tr>
						<td>Descrição</td>
						<td><input type="text" name="descricao"
							value="<%=selectedRota.getDescricao()%>"></input>
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