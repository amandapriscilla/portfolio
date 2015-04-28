<%@ page import="java.util.ArrayList, java.util.List, infinith.sinal.modelo.Rota, infinith.sinal.modelo.Direcao, infinith.sinal.modelo.Georeferencia, infinith.sinal.modelo.Percurso,infinith.sinal.modelo.Noticia"%>
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
			  <a href="FrontController?pagina=home"><u>HOME</u></a> » <a href="FrontController?pagina=noticias&acao=listar"><u>NOTICIAS</u></a>
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
	ArrayList<Noticia> ultNoticias = (ArrayList<Noticia>) application.getAttribute("ultimasNoticias");
	if(ultNoticias != null && ultNoticias.size()>0)
    for (Noticia noticia: ultNoticias) {
		
		out.println("<div class='center-news'><p class='newsdate' >" + dateFormat.format(noticia.getDataCadastro())+" "+ noticia.getDataCadastro().getHours()+":"+noticia.getDataCadastro().getMinutes() +"</p><p class='newstitle' >"+ noticia.getTitulo()+"</p><a class='readmore' href='FrontController?pagina=noticias&acao=exibir&idNoticia="+noticia.getIdNoticia()+"'>Leia mais</a></div> ");
	} else out.println("<div class='center-news'><p class='newstitle' >Nenhuma notícia cadastrada!</p></div>");
	%>
	
	</div>
	


		<div id="center-background">			
			
	<h1>NOTÍCIAS</h1>
			<%

	String acao = (String)application.getAttribute("acao");

	dateFormat = new SimpleDateFormat("dd/MM/yyyy"); 

	if (acao.equalsIgnoreCase("exibir")){
		out.println("<table><tr><td><label>Título:</label></td><td>");
		Noticia noticia = (Noticia)application.getAttribute("noticia");
		out.println("<h3>"+ noticia.getTitulo()+"</h3></td></tr>");
		out.println("<tr><td><label>Descrição:</label></td><td><h3>"+ noticia.getDescricao()+"</h3></td></tr>");
		out.println("<tr><td><label>Data cadastro:</label></td><td><h4>" + dateFormat.format(noticia.getDataCadastro())+" "+ noticia.getDataCadastro().getHours()+":"+noticia.getDataCadastro().getMinutes() +"</h4> </td></tr></table>");
	} else {
		if (acao.equalsIgnoreCase("listar")||acao.equalsIgnoreCase("filtrar")){
		    List<Noticia> noticias = (List<Noticia>) application.getAttribute("noticias");
		    String filtro = (String)application.getAttribute("filtro");
		    //monta tabela com todas as notícias
		    out.println("<h2>"+((acao.equalsIgnoreCase("listar"))?("Todas as Notícias"):("Resultado do filtro"))+"</h2> ");
		    out.println("<br /><table><tr><td colspan='2'><form action='FrontController' method='get'><input class='busca' type='hidden' name='acao' value='filtrar'/><input type='hidden' name='pagina' value='noticias'/><table><tr><td>Filtro&nbsp;&nbsp;</td><td><input type='text' name='filtro' value='"+((filtro!=null)?filtro:"")+"'/></td><td><input type='submit' name='btmfiltronoticias' class='btnbusca' value='Filtro de Notícias' title='Buscar Notícias'/></td></tr></table></form></td></tr></table><br />");
		    out.println("<table class='grid'><thead><tr><th>Data Cadastro</th><th>Título</th><th>Leia Mais</th></tr></thead>");
		    int j = 0;
		    for (Noticia noticia : noticias) {
				if(j%2==0) out.println("<tr class='odd'><td>");
					else out.println("<tr><td>");
				out.println(dateFormat.format(noticia.getDataCadastro())+" "+ noticia.getDataCadastro().getHours()+":"+noticia.getDataCadastro().getMinutes() +"</td><td>"+ noticia.getTitulo()+"</td><td><a href='FrontController?pagina=noticias&acao=exibir&idNoticia="+noticia.getIdNoticia()+"' title='Leia Mais'><img src='imagens/button/leiamais.png' alt='Leia Mais'/></a></td></tr> ");
				j++;
		    }
		    int totalDePaginas = Integer.parseInt((String) application.getAttribute("totalPaginas"));
		    int pSelected = Integer.parseInt((String) application.getAttribute("pSelected"));
		    int intPaginasSelected= Integer.parseInt((String) application.getAttribute("intPaginasSelected"));
		    int intPaginas = 5;
		    int limIntPaginasSup = ((intPaginasSelected*intPaginas >= totalDePaginas)?totalDePaginas:intPaginasSelected*intPaginas);
		    int limIntPaginasInf = ((intPaginasSelected==1)?1:(intPaginasSelected - 1)*intPaginas);
		  	
		    if(j>5){
		    //monta tabela com paginação
		    out.println("<tfoot><tr><td colspan='3'><h3>");
		    out.println("<a href='FrontController?pagina=noticias&acao="+((acao.equalsIgnoreCase("listar"))?("listar"):("filtrar"))+"&filtro="+((filtro!=null)?filtro:"")+"&paginaSelected="+((intPaginasSelected*intPaginas>=totalDePaginas)?totalDePaginas:(limIntPaginasSup + 1))+"&intPaginasSelected="+((intPaginasSelected*intPaginas>=totalDePaginas)?intPaginasSelected:(intPaginasSelected + 1))+"'>|>|</a>");
		    for (int i = limIntPaginasSup; i >= limIntPaginasInf; i--) {
				out.println("<a class='leiamais' href='FrontController?pagina=noticias&acao="+((acao.equalsIgnoreCase("listar"))?("listar"):("filtrar"))+"&filtro="+((filtro!=null)?filtro:"")+"&paginaSelected="+i+"&intPaginasSelected="+intPaginasSelected+"'>|"+((pSelected==i)?("Pagina "+i):(i))+"|</a>");
			}
		    out.println("<a class='leiamais' href='FrontController?pagina=noticias&acao="+((acao.equalsIgnoreCase("listar"))?("listar"):("filtrar"))+"&filtro="+((filtro!=null)?filtro:"")+"&paginaSelected="+((intPaginasSelected==1)?intPaginasSelected:(intPaginasSelected - 1)*intPaginas)+"&intPaginasSelected="+((intPaginasSelected==1)?intPaginasSelected:(intPaginasSelected - 1))+"'>|<|</a>");
		    
		    out.println("</h3></td></tr></tfoot>");
		    }
		    out.println("</table>");
		    
		}
	}
    

%>			</form>
			<p>&nbsp;</p>
		</div>	
		<div id="center-sectionbar" style="background-image: url(imagens/section/noticias.png);">
		</div>
	</div>
			<jsp:include page="/rodape.html" />