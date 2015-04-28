<%@ page session="true" %>
<%@ page import="java.util.ArrayList, infinith.sinal.modelo.Direcao, infinith.sinal.modelo.Rota, infinith.sinal.enums.Aviso"%>


<!-- Configuração Global de Pagina -->
<jsp:include page="cabecalho.jsp"/>

<!-- Configuração Individual da Página -->
</head>
<body>
		<jsp:include page="/cabecalho.html" />
		<!-- MIGALHA DE PÃO -->		  
         <div id="header-trackingpath"> 	  	
			  <a href="ComutadorServlet?pagina=m"><u> HOME ADMIN </u></a> » <a href="#"><u>DIREÇÕES</u></a>
						</div>
		<!-- Info de Usuário Logado e Menu Lateral -->
		<jsp:include page="menu.jsp"/>

	
	
		<div id="center-background">			
		<h1>Direções </h1>
		
	
	<p style="text-indent:0px"><a href="ComutadorServlet?p=cadastroDirecao" title="Nova Direção"><img src="imagens/button/novo.png" alt="Nova Direção"/></a></p>
	
	<%  
		ArrayList<Direcao> direcoes = (ArrayList<Direcao>) application.getAttribute("lista");
		if(direcoes != null && direcoes.size()>0){		
	
	%>
		<table class="grid" align="center" cellspacing="5" cellpadding="5" frame="border">
		<!-- CODIGO PADRAO PARA FEEDBACK DE USUARIO -->		
	  <caption>
	  
	  <% 
			Aviso a = (Aviso) application.getAttribute("aviso");
			if(a != null) out.print("<br /><div class='"+a.getTipo()+"'>"+a.getDescricao()+"</div><br />");
			application.removeAttribute("aviso");
		%></caption>
				
				
				<thead><tr>
						<th>Rota</th>
						<th>Direção</th>
						<th></th>
				</tr></thead><tbody>
				<%
				
					if (direcoes.size() > 0) {
						int i=0;
						for (Direcao direcao : direcoes) {
						
						out.println("<tr"+ ((i%2==0)?" class='odd'":"") +">"
									+ "</td>" + "<td>" + direcao.getRota().getNome()+" "+ direcao.getRota().getDescricao()+ "</td>"
									+ "</td>" + "<td>" + direcao.getDescricao() + "</td>"																
									+ "<td><a href=\"CrudDirecoes?p=excluir&r=" + direcao.getId()
									+ "\"><img src=\"delete.gif\" alt=\"Excluir esta direcao\" title=\"Excluir esta direção\"/></a> <a href=\"CrudDirecoes?p=editar&r=" + direcao.getIdDirecao()+"\">"
									+"<img src=\"edit.png\" alt=\"Editar esta direcao\" title=\"Editar esta direcao\"/></a><a href=\"CrudDirecoes?p=listaPercurso&iddirecao="+direcao.getId() +"\">Percurso</a></td>");
						i++;
						}
						application.removeAttribute("lista");
					} 
				%>
			</tbody></table>
	<% }		
		%>
		
		
		</div>
		
		
		<div id="center-sectionbar" style="background-image: url(../imagens/section/home.png);">
		</div>
	</div>
			<jsp:include page="/rodape.html" />