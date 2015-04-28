<%@ page import="java.util.ArrayList,infinith.sinal.modelo.Georeferencia, infinith.sinal.enums.Aviso"%>

<%@ page session="true"%>
<!-- Configuração Global de Pagina -->
	<jsp:include page="cabecalho.jsp"/>

<!-- Configuração Individual da Página -->
</head>
<body>
<!-- CABECALHO DO SINAL -->
	<jsp:include page="/cabecalho.html"/>

<!-- MIGALHA DE PÃO -->		  
		<div id="header-trackingpath">	
		<a href="ComutadorServlet?p=m"><u>HOME </u></a> » <a href="ComutadorServlet?p=listaRotas"><u> ROTAS </u></a> » <a href="#"><u>EDIÇÃO</u></a>
			
	</div>
		<jsp:include page="menu.jsp"/>

	
		<div id="center-background">
			<h1>Paradas </h1>
			
	<p style="text-indent:0px"><a href="ComutadorServlet?p=cadgeo" title="Nova Parada"><img src="imagens/button/novo.png" alt="Nova Parada"/></a></p>
						
			
			<table class="grid" align="center" cellspacing="10" cellpadding="10" frame="border">
				<caption>
						<!-- CODIGO PADRAO PARA FEEDBACK DE USUARIO -->
	  <% 
			Aviso a = (Aviso) application.getAttribute("aviso");
			if(a != null) out.print("<div class='"+a.getTipo()+"'>"+a.getDescricao()+"</div>");
			application.removeAttribute("aviso");
		%>
				</caption>
				<tr>
					
					<th>Código</th>
					<th>Descrição</th>
					<th>Latitude</th>
					<th>Longitude</th>
					<th>Opções</th>
				</tr>
				<%
					String checado = "";
					ArrayList<Georeferencia> paradas = (ArrayList<Georeferencia>) application.getAttribute("lista");
					if (paradas.size() > 0) {
						int i=0;
						for (Georeferencia parada : paradas)
						{
							checado = (parada.isImportancia()) ? " checked=\"checked\" " : " ";
							out.println("<tr"+((i%2==0)?" class='odd'":"") +"><td>"+ parada.getCodigo()
									+ "</td><td>" + parada.getDescricao()
									+ "</td><td>" + parada.getLatitude() + "</td>"
									+ "<td>" + parada.getLongitude() + "</td>"
									+ "<td><a href=\"CrudGeoreferencias?p=editar&r=" + parada.getIdGeoreferencia()
									+ "\"><img src=\"edit.png\" alt=\"Alterar este cadastro\" title=\"Alterar este cadastro\"/></a> "
									+ "<a href=\"CrudGeoreferencias?p=excluir&r=" + parada.getIdGeoreferencia()
									+ "\"><img src=\"delete.gif\" alt=\"Excluir esta parada\" title=\"Excluir esta parada\"/></a> "
									+ "</td>");
						i++;
						}
						application.removeAttribute("lista");
					} else {
						out.println("Nenhuma parada cadastrada.");
					}
				%>
			</table>
		</div>
		<p>&nbsp;</p>

		</div>	
		<div id="center-sectionbar" style="background-image: url(imagens/section/rotas.png);">
		</div>
	</div>
			<jsp:include page="/rodape.html" />