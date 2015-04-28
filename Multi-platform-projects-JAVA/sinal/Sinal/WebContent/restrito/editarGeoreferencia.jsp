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
	<% Georeferencia g = (Georeferencia)application.getAttribute("parada"); %>
		<jsp:include page="/cabecalho.html" />

		<div id="painelUsuario">
			Bem vindo,
			<%=session.getAttribute("nome")%>. <a href="LogoutServlet">sair</a>
		</div>

		<jsp:include page="menu.jsp"/>

		<div id="content" >
		<div id="illustration"></div>
		<div id="edicaoEmpresa">
			<h2 style="text-align: center">Editar Parada</h2>
			<form action="CrudGeoreferencias" method="post">
				<input type="hidden" name="p" value="aplicar" /> 
				<table>
					<tr>
						<th>Código</th>
						<th>Descrição</th>
						<th>Latitude</th>
						<th>Longitude</th>
						<th>Importante</th>
					</tr>
					<tr>
						<td><input type="text" name="codigo" value="<%= g.getCodigo() %>"/></td>
						<td><input type="text" name="descricao" value="<%= g.getDescricao() %>"/></td>
						<td><input type="text" name="latitude" value="<%= g.getLatitude() %>"/></td>
						<td><input type="text" name="longitude" value="<%= g.getLongitude() %>"/></td>
						<td><input type="checkbox" name="importante" <% if(g.isImportancia()) out.print("checked=\"checked\""); %>/>
						<input type="hidden" name="id" value="<%= g.getIdGeoreferencia() %>"/></td>
						<td>
							<input type="submit" value="Aplicar" alt="Clique aqui para aplicar as alterações" title="Clique aqui para aplicar as alterações" style="width: auto;" />
							<input type="button" value="Cancelar" onclick="cancelar()" alt="Clique aqui para cancelar e voltar à lista" title="Clique aqui para cancelar e voltar à lista" style="width: auto;" />
						</td>
					</tr>
				</table>
			</form>
		</div>
		</div>
		<a href="ComutadorServlet?p=lisgeo">Listar Paradas</a>
		<div id="sidetitle">
       		<div id="titlehome">  </div>
		</div>

		</div>
		
		<jsp:include page="/WEB-INF/html/rodape.html" />
	</div>
</body>
</html>