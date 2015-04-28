<%@ page import="infinith.sinal.modelo.*" %>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function cancelar()
	{
		window.back();
	}
</script>
<link rel="shortcut icon" href="iconesinal.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="estilo.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SINAL - Editar Empresa</title>
</head>
<body>
	<% Empresa e = (Empresa)application.getAttribute("empresa"); %>
	<div id="main">
		<jsp:include page="/cabecalho.html" />

		<div id="painelUsuario">
			Bem vindo,
			<%=session.getAttribute("nome")%>. <a href="LogoutServlet">sair</a>
		</div>

		<jsp:include page="/WEB-INF/html/menu.html" />

		<div id="edicaoEmpresa">
			<h2 style="text-align: center">Editar Empresa</h2>
			<form action="CrudEmpresas" method="post">
				<input type="hidden" name="p" value="aplicar" /> 
				<table>
					<tr>
						<th>Fantasia</th>
						<th>Razão</th>
						<th>CNPJ</th>
						<th>Insc. Mun.</th>
						<th>Insc. Est.</th>
					</tr>
					<tr>
						<td><input type="text" name="fantasia" value="<%= e.getNomeFantasia() %>"/></td>
						<td><input type="text" name="razao" value="<%= e.getRazaoSocial() %>"/></td>
						<td><input type="text" name="cnpj" value="<%= e.getCnpj() %>"/></td>
						<td><input type="text" name="inscmun" value="<%= e.getInscMunicipal() %>"/></td>
						<td><input type="text" name="inscest" value="<%= e.getInscEstadual() %>"/>
						<input type="hidden" name="id" value="<%= e.getIdEmpresa() %>"/></td>
						<td>
							<input type="submit" value="Aplicar" alt="Clique aqui para aplicar as alterações" title="Clique aqui para aplicar as alterações" style="width: auto;" />
							<input type="button" value="Cancelar" onclick="cancelar()" alt="Clique aqui para cancelar e voltar à lista" title="Clique aqui para cancelar e voltar à lista" style="width: auto;" />
						</td>
					</tr>
				</table>
			</form>
		</div>
		
		<a href="ComutadorServlet?p=m">Voltar</a>

		<div id="rodape"><jsp:include page="/WEB-INF/html/rodape.html" /></div>
	</div>
</body>
</html>