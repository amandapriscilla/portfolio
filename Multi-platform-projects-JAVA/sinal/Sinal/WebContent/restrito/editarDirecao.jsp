<%@ page session="true" %>
<%@ page import="java.util.ArrayList,infinith.sinal.modelo.Rota, infinith.sinal.modelo.Direcao, infinith.sinal.modelo.Georeferencia, infinith.sinal.modelo.Percurso,infinith.sinal.enums.Aviso "%>

<!-- Configuração Global de Pagina -->
	<jsp:include page="cabecalho.jsp"/>

<!-- Configuração Individual da Página -->
</head>
<body>
<!-- CABECALHO DO SINAL -->
	<jsp:include page="/cabecalho.html"/>

<!-- MIGALHA DE PÃO -->		  
		<div id="header-trackingpath">
			  <a href="FrontController?pagina=home">HOME_ADMIN </u></a> » <a href="ComutadorServlet?pagina=listaDirecao"><u> DIREÇÃO </u></a> » <a href="#"><u> EDIÇÃO</u></a>
  	</div>
		<jsp:include page="menu.jsp"/>

	
	
		<div id="center-background">			
		<h1>Direções </h1>
		<h2>Edição de Direção </h2>
		<a href="ComutadorServlet?p=listaDirecao">Listar Direções</a>
			<form action="CrudDirecoes" name="formCad" method="post">
				<table>
						<!-- CODIGO PADRAO PARA FEEDBACK DE USUARIO -->
<caption>	  <% 
			Aviso a = (Aviso) application.getAttribute("aviso");
			if(a != null) out.print("<div class='"+a.getTipo()+"'>"+a.getDescricao()+"</div>");
			application.removeAttribute("aviso");
		%>		</caption>	
				
					<tr>
						<td><label>Rota</label> </td></tr><tr>
						<td> <select class="input" name="idRota" title="Selecione uma rota" onchange="setRota()">
							<option value="0" selected="selected">ROTA</option>
							<%
							ArrayList<Rota> rotas = (ArrayList<Rota>) application.getAttribute("listaRotas");
							Direcao d = (Direcao) application.getAttribute("direcao");
							if (rotas != null) {
									int i = 0;
									for (Rota rota : rotas) {
										out.println("<option value='"
												+ rota.getId() +"' "+(d.getRota().getId()==rota.getId()?"selected":"")+" >"
												+ rota.getNome() + " - " + rota.getDescricao() + "</option>");
									}
								} else {
									out.println("Nenhuma rota cadastrada.");
								}
							%>
					</select></td>
					</tr>
					<tr>
						<td><label>Direção</label> </td></tr><tr>
						<td><input class="input" name="descricao" title="Digite o nome da direção" value="<%= d.getDescricao() %>"/> 
							<input type="hidden" name="p" value="alterar" />
							<input type="hidden" name="id" value="<%= d.getId()%>" />
							</td>
					</tr>
					
		
					<tr>
						<td><input type="reset" value="Cancelar"/></td>
						<td><input type="submit" name="ok" value="Salvar"/>
				
						</td>
					</tr>	
		</table>
			
		</form>		

		</div>
		
		
		<div id="center-sectionbar" style="background-image: url(../imagens/section/home.png);">
		</div>
	</div>
			<jsp:include page="/rodape.html" />