<%@ page import="infinith.sinal.modelo.*" %>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/restrito/cabecalho.jsp" />
<script type="text/javascript">
	function cancelar()
	{
		window.back();
	}
</script>
</head>
<body>
	<% Empresa e = (Empresa)application.getAttribute("empresa"); %>
		<jsp:include page="/cabecalho.html" />

		<div id="painelUsuario">
			Bem vindo,
			<%=session.getAttribute("nome")%>. <a href="LogoutServlet">sair</a>
		</div>

		<jsp:include page="menu.jsp"/>
		
<div id="content">
		<div id="edicaoEmpresa">
			<h2 style="text-align: center">Editar Empresa</h2>
			<form action="CrudEmpresas" method="post">
			<table style="">
				<input type="hidden" name="p" value="aplicar" />
				<tr><td><label>Nome Fantasia</label></td><td><input type="text" name="fantasia" value="<%= e.getNomeFantasia() %>"/></td></tr>
				<tr><td><label>Razão Social</label></td><td><input type="text" name="razao" value="<%= e.getRazaoSocial() %>"/></td></tr>
				<tr><td><label>CNPJ</label></td><td><input type="text" name="cnpj" value="<%= e.getCnpj() %>"/></td></tr>
				<tr><td><label>Insc. Municipal</label></td><td><input type="text" name="inscmun" value="<%= e.getInscMunicipal() %>"/></td></tr>
				<tr><td><label>Insc. Estadual</label></td><td><input type="text" name="inscest" value="<%= e.getInscEstadual() %>"/></td></tr>
				<input type="hidden" name="id" value="<%= e.getIdEmpresa() %>"/>
				<tr><td colspan="2"><input type="submit" value="Aplicar" alt="Clique aqui para aplicar as alterações" title="Clique aqui para aplicar as alterações" style="width: auto;" />
				<input type="button" value="Cancelar" onclick="cancelar()" alt="Clique aqui para cancelar e voltar à lista" title="Clique aqui para cancelar e voltar à lista" style="width: auto;" /></td></tr>
			</table>
			</form>
		</div>
<p>&nbsp;</p>
</div>

		<a href="ComutadorServlet?p=lisemp">Listar Empresas</a>
		<div id="sidetitle">
       		<div id="titlehome">  </div>
		</div>
	</div>
	<jsp:include page="/rodape.html" />
	
	</div>
</body>
</html>