<%@ page session="true" %>
<%@ page import="infinith.sinal.enums.Aviso,infinith.sinal.modelo.Rota,java.util.ArrayList" %>
<!-- Configuração Global de Pagina -->
	<jsp:include page="cabecalho.jsp"/>

<!-- Configuração Individual da Página -->
</head>
<body>
<!-- CABECALHO DO SINAL -->
	<jsp:include page="/cabecalho.html"/>

<!-- MIGALHA DE PÃO -->		  
		<div id="header-trackingpath">
		<a href="ComutadorServlet?p=m"><u>HOME_ADMIN </u></a> » <a href="#"><u> ROTAS </u></a>
				</div>
		<!-- Info de Usuário Logado e Menu Lateral -->
		<jsp:include page="menu.jsp"/>
	
	
		<div id="center-background">			
			<h1>Rotas </h1>
		<p style="text-indent:0px"><a href="ComutadorServlet?p=cadastroRota" title="Nova Rota"><img src="imagens/button/novo.png" alt="Nova Rota"/></a></p>
		
		<table class="grid" align="center" cellspacing="5" cellpadding="5" frame="border">
				<caption>
				<% 
			Aviso a = (Aviso) application.getAttribute("aviso");
			if(a != null) out.print("<div class='"+a.getTipo()+"'>"+a.getDescricao()+"</div>");
			application.removeAttribute("aviso");%>
				</caption>
				<thead><tr>
						<th>Código</th>
						<th>Nome</th>
						<th>Opções</th>
				</tr></thead>
				<%ArrayList<Rota> rotas = (ArrayList<Rota>) application.getAttribute("lista");
					if (rotas.size() > 0) {
						int i=0;
						for (Rota rota : rotas) {
							out.println("<tr"+ ((i%2==0)?("odd"):(""))
									+ "</td>" + "<td>" + rota.getNome() + "</td>"
									+ "</td>" + "<td>" + rota.getDescricao() + "</td>"
									+ "<td><a href=\"CrudRotas?p=editar&r=" + rota.getIdRota()+"\"><img src=\"edit.png\" alt=\"Editar esta rota\" title=\"Editar esta direcao\"/>" 
									+ "</a>&nbsp;&nbsp;<a href=\"CrudRotas?p=excluir&r=" + rota.getIdRota() +"\"><img src=\"delete.gif\" alt=\"Excluir esta rota\" title=\"Excluir esta rota\"/></a></td></tr>");
						i++;
						}
						application.removeAttribute("lista");
					}
				%>
			</table>
		
</div>
		
		
		<div id="center-sectionbar" style="background-image: url(imagens/section/rotas.png);">
		</div>
	</div>
			<jsp:include page="/rodape.html" />