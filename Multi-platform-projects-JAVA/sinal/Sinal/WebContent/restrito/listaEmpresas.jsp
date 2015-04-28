<%@ page import="java.util.ArrayList,infinith.sinal.modelo.Empresa, infinith.sinal.enums.Aviso"%>
<%@ page session="true" %>

<!-- Configuração Global de Pagina -->
	<jsp:include page="/header.jsp"/>

<!-- Configuração Individual da Página -->
</head>
<body>
		<jsp:include page="/cabecalho.html" />
		<!-- MIGALHA DE PÃO -->		  
         <div id="header-trackingpath"> 	  	
			  <a href="#"><u>HOME_ADMIN</u></a>
			</div>
		<!-- Info de Usuário Logado e Menu Lateral -->
		<jsp:include page="menu.jsp"/>

	
		<div id="center-background">			
	<h1>Empresas</h1>
	
		
		<table  frame="border">
			<tr>
				<th colspan="5"><a href="ComutadorServlet?p=cademp">Nova Empresa</a></th>
			<tr>
			<tr>
				<th>Fantasia</th>
				<th>Razão</th>
				<th>CNPJ</th>
				<th>Opções</th>
			</tr>
			<%
				ArrayList<Empresa> empresas = (ArrayList<Empresa>) application.getAttribute("lista");
				if (empresas.size() > 0) {
					int i=0;
					for (Empresa empresa : empresas) {
						out.println("<tr><td>"+ empresa.getNomeFantasia()
								+ "</td><td>" + empresa.getRazaoSocial()
								+ "</td><td>" + empresa.getCnpj()
								+ "</td><td><a href=\"CrudEmpresas?p=editar&r=" + empresa.getIdEmpresa()
								+ "\"><img src=\"edit.png\" alt=\"Alterar este cadastro\" title=\"Alterar este cadastro\"/></a> "
								+ "<a href=\"CrudEmpresas?p=excluir&r=" + empresa.getIdEmpresa()
								+ "\"><img src=\"delete.gif\" alt=\"Excluir esta empresa\" title=\"Excluir esta empresa\"/></a> "
								+ "</td>");
					}
					application.removeAttribute("lista");
				} else {
					out.println("Nenhuma empresa cadastrada.");
				}
			%>
		</table>
</div>
<p>&nbsp;</p>
</div>
	<div id="sidetitle">
       	<div id="titlehome">  </div>
	</div>
   <div>
<!-- RODAPE DO SINAL -->
	<jsp:include page="/rodape.html"/>
	
	</div>
</body>
</html>