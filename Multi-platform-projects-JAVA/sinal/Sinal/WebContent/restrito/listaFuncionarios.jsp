<%@ page import="java.util.ArrayList, infinith.sinal.modelo.Funcionario,infinith.sinal.enums.Aviso"%>


<!-- Configura��o Global de Pagina -->
<jsp:include page="cabecalho.jsp"/>

<!-- Configura��o Individual da P�gina -->
</head>
<body>
		<jsp:include page="/cabecalho.html" />
		<!-- MIGALHA DE P�O -->		  
         <div id="header-trackingpath"> 	  	
			  <a href="ComutadorServlet?pagina=m"><u> HOME ADMIN </u></a> � <a href="#"><u>DIRE��ES</u></a>
						</div>
		<!-- Info de Usu�rio Logado e Menu Lateral -->
		<jsp:include page="menu.jsp"/>

	
	
		<div id="center-background">			
	
<h1>Funcionarios </h1>
<p style="text-indent:0px"><a href="ComutadorServlet?p=cadfunc" title="Novo Funcion�rio"><img src="imagens/button/novo.png" alt="Novo Funcion�rio]"/></a></p>
	

			<table class="grid" align="center" cellspacing="5" cellpadding="5" frame="border">
	<caption>
	  <% 
			Aviso a = (Aviso) application.getAttribute("aviso");
			if(a != null) out.print("<br /><div class='"+a.getTipo()+"'>"+a.getDescricao()+"</div><br />");
			application.removeAttribute("aviso");
		%>
	</caption>
				<tr>
					
					<th>Nome</th>
					<th>Login</th>
					<th>Cargo</th>
					<th>Op��es</th>
					
				</tr>
				<%
					ArrayList<Funcionario> funcionarios = (ArrayList<Funcionario>) application.getAttribute("lista");
					if (funcionarios.size() > 0) {
					int i = 0;
						for (Funcionario funcionario : funcionarios) {
							out.println("<tr"+((i%2==0)?" class='odd'":"") +"><td>"+ funcionario.getNome()
									+ "<td>" + funcionario.getLogin() + "</td>"
									+ "<td>" + funcionario.getCargo() + "</td>"		
									+"<td><a href=\"CrudFuncionarios?p=editar&r=" + funcionario.getIdFuncionario()+"\"><img src=\"edit.png\" title='Editar Funcion�rio'/></a> &nbsp;&nbsp;"
							+ "<a href=\"CrudFuncionarios?p=excluir&r=" + funcionario.getIdFuncionario()
							+ "\"><img src=\"delete.gif\" alt=\"Excluir esta funcionario\" title=\"Excluir este funcion�rio\"/></a></td>");

							i++;
						}
						application.removeAttribute("lista");
					} else {
						out.println("Nenhum funcionario cadastrado.");
					}
				%>
			</table>
	
   </div> 
		<div id="center-sectionbar" style="background-image: url(../imagens/section/home.png);">
		</div>
	</div>
			<jsp:include page="/rodape.html" />