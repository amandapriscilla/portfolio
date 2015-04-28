<%@ page import="java.util.ArrayList, infinith.sinal.modelo.Sac"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="iconesinal.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="sinal.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SINAL - Listagem de SACs</title>

<script type="text/javascript">
	function filtrarSac()
	{
		
	}
</script>

</head>
<body>
		<jsp:include page="/cabecalho.html" />
		<!-- <div id="painelUsuario">
		Bem vindo, <%= session.getAttribute("nome") %>.
		<a href="LogoutServlet">sair</a></div> -->
		<jsp:include page="menu.jsp"/>
		
<div id="content">
<div id="illustration"></div>
<div id="tabelaVeiculos">
<h2 style="text-align: center">Listagem de SACs</h2>

	<form action="CrudSac" name="formAssunto">
		<input type="hidden" name="p" value="assunto" />
		<select class="input" name="assuntoEscolhido" >
			<option value="0" selected="selected">Escolha o assunto</option>
			<option value="Denúncia" onclick="">Denúncia</option>
			<option value="Reclamação">Reclamação</option>
			<option value="Dúvida">Dúvida</option>
			<option value="Melhoria">Melhoria</option>
			<option value="Elogio">Elogio</option>
		</select>
		<input type="submit" class="botao" value="Listar"/>
	</form>
	
			<table align="center" cellspacing="10" cellpadding="10" frame="border">
				
				<%
					if(application.getAttribute("lista") != null){
						ArrayList<Sac> sacs = (ArrayList<Sac>) application.getAttribute("lista");
						if (sacs.size() > 0) {
							int i=0;
							for (Sac sac : sacs) {
								out.println("<tr>"
										+"<th>Nome do Solicitante</th>"
										+"<th>E-Mail</th>"
										+"<th>Assunto</th>"
										+"<th>Opções</th>"
										+"</tr><tr>"
										+ "</td>" + "<td>" + sac.getNome() + "</td>"
										+ "</td>" + "<td>" + sac.getEmail() + "</td>"
										+ "</td>" + "<td>" + sac.getAssunto() + "</td>"
										+ "<td><a href=\"CrudSac?p=excluir&r=" + sac.getIdSac()
										+ "\"><img src=\"delete.gif\" alt=\"Excluir esta veículo\" title=\"Excluir esta veículo\"/></a></td>");
							}
							application.removeAttribute("lista");
						} else {
							out.println("Sem solicitações para este assunto.");
						}
					}
				%>
			</table>
		</div>
		<p>&nbsp;</p>
		</div>
		
		<div id="sidetitle">
       	<div id="titlehome">  </div>
	</div>
	</div>
	<jsp:include page="/rodape.html" />
	
	</div>
</body>
</html>