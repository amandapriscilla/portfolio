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
		<a href="FrontController?pagina=home"><u>HOME</u></a> » <a href="FrontController?pagina=rotas&acao=listar"><u>ROTAS</u></a>	
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
		
		out.println("<div class='center-news'><p class='newsdate' >" + dateFormat.format(noticia.getDataCadastro())+" "+ noticia.getDataCadastro().getHours()+":"+noticia.getDataCadastro().getMinutes() +"</p><p class='newstitle' >"+ noticia.getTitulo()+"</p><a class='readmore' href='FrontController?pagina=noticias&acao=exibir&idNoticia="+noticia.getIdNoticia()+"'>Leia mais</a></div> ");
	} else out.println("<div class='center-news'><p class='newstitle' >Nenhuma notícia cadastrada!</p></div>");
	%>
	
	</div>
	


		<div id="center-background">	
	
 
	<h1>ROTAS</h1>
			<%
			
			ArrayList<Rota> rotas = (ArrayList<Rota>) application.getAttribute("rotas");
		    String filtro = (String)application.getAttribute("filtro");
			
			
		    out.println("<form action='FrontController' method='get'><table>"+
		    		"<tr><td><input class='busca' type='hidden' name='acao' value='filtrar'/><input type='hidden' name='pagina' value='rotas'/>Filtro&nbsp;&nbsp;</td><td><input type='text' name='filtro' value='"+((filtro!=null)?filtro:"")+"'/></td><td><input type='submit' name='btmfiltrorotas' class='btnbusca' value='Filtro de Rotas' title='Buscar Rotas'/></td></tr></table></form><br />");
		    out.println("<h3>Lista de Rotas</h3>");
		    out.println("<table class='grid'><thead><tr><th>Codigo</th><th>Descricao</th></tr></thead><tbody>");
		    int i = 0;
		    for (Rota rota : rotas) {
				if(i%2==0) out.print("<tr class='odd'><td>");
				else  out.print("<tr><td>");
		    	i++;
				out.println(rota.getNome()+"</td><td>"+ rota.getDescricao()+"</td></tr> ");
			}
		    out.println("</tbody></table>");

%>	
			
		
		</div>
		
		<div id="center-sectionbar" style="background-image: url(imagens/section/rotas.png);">
		
		</div>
	</div>
			<jsp:include page="/rodape.html" />