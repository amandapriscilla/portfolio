<%@ page import="java.util.ArrayList,infinith.sinal.modelo.Rota, infinith.sinal.modelo.Direcao, infinith.sinal.modelo.Georeferencia, infinith.sinal.modelo.Percurso,infinith.sinal.modelo.Noticia"%>
<%@ page import="java.text.ParseException, java.text.SimpleDateFormat, java.util.Date"%>

<!-- Configuração Global de Pagina -->
	<jsp:include page="/header.jsp"/>

<!-- Configuração Individual da Página -->
</head>
<body>
<!-- CABECALHO DO SINAL -->
	<jsp:include page="/cabecalho.html"/>

<!-- MIGALHA DE PÃO -->		  
          	  
		<div id="header-trackingpath">
			  <a href="FrontController?pagina=home"><u>HOME</u></a> » <a href="FrontController?pagina=itinerarios&acao=listar"><u>ITINERÁRIOS</u></a>
		</div>
		<div id="header-diagonalgraybox"></div>
		<div id="header-background">
		
	  <!-- FORM CONSULTAR HORARIO E TEMPO DE ESPERA-->
		<jsp:include page="/consultarHorario.jsp"/>
		
		</div>
	</div>
		
	<!-- Middle -->
		
	<div id="middle">
	<div id="middle-orangebox"></div>
	<div id="middle-bannerbar"></div>
	</div>
	
	<!-- Center -->
	<div id="center"> 
		<div id="sidemenubar">
	<h3 class='newsheader'> Últimas Notícias </h3>
<%
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");  
	ArrayList<Noticia> noticias = (ArrayList<Noticia>) application.getAttribute("ultimasNoticias");
	if(noticias != null && noticias.size()>0)
    for (Noticia noticia: noticias) {
		
		out.println("<div class='center-news'><p class='newsdate' >" + dateFormat.format(noticia.getDataCadastro())+" "+ noticia.getDataCadastro().getHours()+":"+noticia.getDataCadastro().getMinutes() +"</p><p class='newstitle' >"+ noticia.getTitulo()+"</p><a class='readmore' href='FrontController?pagina=noticias&acao=exibir&idNoticia="+noticia.getId()+"'>Leia mais</a></div> ");
	} else out.println("<div class='center-news'><p class='newstitle' >Nenhuma notícia cadastrada!</p></div>");
	%>
	
	</div>
	
	
		<div id="center-background">			
		<h1>ITINERÁRIOS</h1>
		<%
			int i = 0;
			ArrayList<Rota> rotas = (ArrayList<Rota>) application.getAttribute("rotas");
		  if(rotas.size()>0){
				out.println("<table class='grid'><thead> <tr><th>Codigo</th><th>Descricao</th><th>Ver Itinerário</th></tr></thead><tbody>");
		    for (Rota rota : rotas) {
		    	if(i % 2 == 0) out.println("<tr class='odd'><td>");
		    	else out.println("<tr><td>");
		    	out.println(rota.getNome()+"</td><td>"+ rota.getDescricao()+"</td><td><a target='_blank' class='leiamais' href='FrontController?pagina=itinerarios&acao=exibir' title='Ver Itinerário'><img src='imagens/button/itinerario.png' alt='Ver Itinerário'/></a></td></tr> ");
		    	i++;
		    }
		    	out.println("</tbody></table>");
		   }
%>	
		
			<p>&nbsp;</p>
		</div>
		
		<div id="center-sectionbar" style="background-image: url(../imagens/section/itinerarios.png);">
		</div>
	</div>
			<jsp:include page="/rodape.html" />