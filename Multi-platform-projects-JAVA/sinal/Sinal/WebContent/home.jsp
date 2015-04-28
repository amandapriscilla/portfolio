<%@ page import="infinith.sinal.modelo.Rota, infinith.sinal.modelo.Direcao, infinith.sinal.modelo.Georeferencia, infinith.sinal.modelo.Percurso"%>
<%@ page import="java.util.ArrayList,java.text.ParseException, java.text.SimpleDateFormat, java.util.Date,infinith.sinal.modelo.Noticia"%>

<!-- Configuração Global de Pagina -->
	<jsp:include page="header.jsp"/>

<!-- Configuração Individual da Página -->

</head>
<body>
<!-- CABECALHO DO SINAL -->
	<jsp:include page="cabecalho.html"/>

<!-- MIGALHA DE PÃO -->		  
		<div id="header-trackingpath">
			<a href="#">HOME</a> 
		</div>
		<div id="header-diagonalgraybox"></div>
		<div id="header-background">
		
	  <!-- FORM CONSULTAR HORARIO E TEMPO DE ESPERA-->
		<jsp:include page="consultarHorario.jsp"/>
		
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
			<h2> Cansado de perder o ônibus e chegar atrasado?</h2>
			
			<table>
			<tr>
			<td style="margin-left: 20px;"><img  src="imagens/data/relogio.PNG" alt="Relógio"  style="width: 108px; height: 133px"/></td>
			<td><p style="margin-left: 30px;">O <b>Sistema de Notificações Automáticas de Localização (SINAL)</b> é um conceito novo em tecnologia que fornece à população em geral um serviço de consulta a horários em tempo real de transportes públicos em circulação na cidade de Natal e Grande Natal.</p></td>
			</tr>
			</table>
					
		</div>
		
		<div id="center-sectionbar">
		
		</div>
	</div>
			<jsp:include page="rodape.html" />
