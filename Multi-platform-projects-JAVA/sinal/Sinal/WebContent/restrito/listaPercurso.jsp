
<%@ page session="true" %>
<%@ page import="infinith.sinal.modelo.Rota, infinith.sinal.modelo.Direcao, infinith.sinal.modelo.Georeferencia, infinith.sinal.enums.Aviso, infinith.sinal.modelo.Percurso, java.util.List"%>
<!-- Configuração Global de Pagina -->
	<jsp:include page="/header.jsp"/>

<!-- Configuração Individual da Página -->
</head>
<body>
		<jsp:include page="/cabecalho.html" />
		<!-- MIGALHA DE PÃO -->		  
         <div id="header-trackingpath"> 	  	
			  <a href="#"><u>HOME ADMIN </u></a> » <a href="#"><u> DIREÇÃO </u></a> » <a href="#"><u> PERCURSO</u></a>
			</div>
		<!-- Info de Usuário Logado e Menu Lateral -->
		<jsp:include page="menu.jsp"/>

	
	
		<div id="center-background">			
			<h1>Percursos</h1>		

		<a href="ComutadorServlet?p=listaDirecao">Listar Direções</a>
			
				<table >
					<caption>
		<!-- CODIGO PADRAO PARA FEEDBACK DE USUARIO -->
	  <% 
			Aviso a = (Aviso) application.getAttribute("aviso");
			if(a != null) out.print("<div class='"+a.getTipo()+"'>"+a.getDescricao()+"</div>");
			application.removeAttribute("aviso");
		%>		
					</caption>
					<tr>
						<td><label>Rota </label> </td> </tr><tr>
						<td> 
							<% Direcao direcao = (Direcao) application.getAttribute("direcao");
							 out.print(direcao.getRota().getNome()+" - "+ direcao.getRota().getDescricao());
							 %>	
							
						</td> </tr><tr>
						<td><label>Direção</label> </td>	</tr><tr>					
						<td><% out.print(direcao.getDescricao());%> </td>
					</tr>
					<tr>
						<td colspan="2"> 
					
				<%
				List<Georeferencia> georeferencias = (List<Georeferencia>) application.getAttribute("listaGeoreferencias");
				List<Percurso> percursos = (List<Percurso>) application.getAttribute("listaPercursos");
				if(percursos != null && percursos.size()!=0){
					out.println("<table  class='grid'><tr><th>Parte da Parada:</th> <th>Chega a Parada:</th><th>Tempo</th><th>Distância</th><tr>"); 	
					for(Percurso p: percursos)
					out.println("<tr><td>"+ p.getGeoreferenciaA().getDescricao()+"</td><td>"+ p.getGeoreferenciaB().getDescricao()+" min.</td><td>"+ p.getTempo()+"metros </td></tr>");		 		
								
		}else{
			out.println("<div class='alerta'><p> Nenhum percurso cadastrado </p></div>");
				}
				%>
				<form action="CrudDirecoes" method="post">	
					
				<input type="hidden" name="p" value="cadastroPercurso" />
				<input type="hidden" name="iddirecao" value="<%=direcao.getId()%>" />
				<input type="submit" name="AddPercurso" value="Add Percurso" />
			</form>
						</td>					
					</tr>
					
		
		</table>
	
   </div> 
		<div id="center-sectionbar" style="background-image: url(../imagens/section/home.png);">
		</div>
	</div>
			<jsp:include page="/rodape.html" />