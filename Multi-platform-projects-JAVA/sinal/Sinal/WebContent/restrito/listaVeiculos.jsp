<%@ page import="java.util.ArrayList, infinith.sinal.modelo.Veiculo, infinith.sinal.enums.Aviso"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/restrito/cabecalho.jsp" />
</head>
<body>
		<jsp:include page="/cabecalho.html" />
		<div id="painelUsuario">
		Bem vindo, <%= session.getAttribute("nome") %>.
		<a href="LogoutServlet">sair</a></div>
		<jsp:include page="menu.jsp"/>
		
<div id="content">
<div id="illustration"></div>
<div id="tabelaVeiculos">
<h2> Lista de Veículos</h2>
	<!-- CODIGO PADRAO PARA FEEDBACK DE USUARIO -->
	  <% 
			Aviso a = (Aviso) application.getAttribute("aviso");
			if(a != null) out.print("<div class='"+a.getTipo()+"'>"+a.getDescricao()+"</div>");
			application.removeAttribute("aviso");
		%>			
			<table align="center" cellspacing="5" cellpadding="5" frame="border">
				<tr>
						<th>Número</th>
						<th>Marca</th>
						<th>Tipo</th>
						<th>Modelo</th>
						<th>Placa</th>
						<th>Ano</th>
					
				</tr>
				<%ArrayList<Veiculo> veiculos = (ArrayList<Veiculo>) application.getAttribute("lista");
					if (veiculos.size() > 0) {
						int i=0;
						for (Veiculo veiculo : veiculos) {
							out.println("<tr>"
										
									+ "</td>" + "<td>" + veiculo.getNumero() + "</td>"
									+ "</td>" + "<td>" + veiculo.getMarca() + "</td>"
									+ "</td>" + "<td>" + veiculo.getTipo() + "</td>"
									+ "</td>" + "<td>" + veiculo.getModelo() + "</td>"
									+ "</td>" + "<td>" + veiculo.getPlaca() + "</td>"
									+ "</td>" + "<td>" + veiculo.getAno() + "</td>"
									+ "<td><a href=\"CrudVeiculos?p=excluir&r=" + veiculo.getIdVeiculo()
									+ "\"><img src=\"delete.gif\" alt=\"Excluir esta veículo\" title=\"Excluir esta veículo\"/></a> <a href=\"CrudVeiculos?p=editar&r=" + veiculo.getIdVeiculo()+"\">Editar</a></td>");
						}
						application.removeAttribute("lista");
					} else {
						out.println("Nenhum veículo cadastrado.");
					}
				%>
			</table>
		</div>
		<p>&nbsp;</p>
		</div>
		
		<a href="ComutadorServlet?p=cadveic">Cadastrar veículo</a>
		
		<div id="sidetitle">
       	<div id="titlehome">  </div>
	</div>
	</div>
	<jsp:include page="/rodape.html" />
	
	</div>
</body>
</html>