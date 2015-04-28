<%@ page import="infinith.sinal.modelo.Rota, infinith.sinal.modelo.Direcao, infinith.sinal.modelo.Georeferencia, infinith.sinal.modelo.Percurso"%>
<%@ page import="java.util.ArrayList,java.text.ParseException, java.text.SimpleDateFormat, java.util.Date,infinith.sinal.modelo.Noticia"%>

<!-- Configuração Global de Pagina -->
	<jsp:include page="/header.jsp"/>

<!-- Configuração Individual da Página -->

</head>
<body>
<!-- CABECALHO DO SINAL -->
	<jsp:include page="/cabecalho.html"/>

<!-- MIGALHA DE PÃO -->		  
		<div id="header-trackingpath">
			<a href="FrontController?pagina=home"><u>HOME</u></a> » <a href="#"><u>SOBRE</u></a> 
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
			<h2> SINAL - Transportes Pontuais</h2>
			
			<table>
			<tr>
			<td style="margin-left: 20px;"><img  src="imagens/data/espera.jpg" alt="Relógio"  style="width: 205px; height: 308px"/></td>
			<td><p style="margin-left: 30px;">O SINAL é o serviço que você estava esperando para deixar de esperar. </p>
			<p  style="margin-left: 30px;"> Isso mesmo! Chega de passar horas esperando um transporte coletivo, saia de casa quando ele estiver chegando. Saiba em tempo real quantos minutos faltam para seu ônibus passar e não perca mais tempo.</p></td>
			</tr>
			</table>
					
		</div>
		
		<div id="center-sectionbar">
		
		</div>
	</div>
			<jsp:include page="/rodape.html" />
