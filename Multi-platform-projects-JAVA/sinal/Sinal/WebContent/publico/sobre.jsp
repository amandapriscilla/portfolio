<%@ page import="infinith.sinal.modelo.Rota, infinith.sinal.modelo.Direcao, infinith.sinal.modelo.Georeferencia, infinith.sinal.modelo.Percurso"%>
<%@ page import="java.util.ArrayList,java.text.ParseException, java.text.SimpleDateFormat, java.util.Date,infinith.sinal.modelo.Noticia"%>

<!-- Configura��o Global de Pagina -->
	<jsp:include page="/header.jsp"/>

<!-- Configura��o Individual da P�gina -->

</head>
<body>
<!-- CABECALHO DO SINAL -->
	<jsp:include page="/cabecalho.html"/>

<!-- MIGALHA DE P�O -->		  
		<div id="header-trackingpath">
			<a href="FrontController?pagina=home"><u>HOME</u></a> � <a href="#"><u>SOBRE</u></a> 
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
			<h3 class='newsheader'> �ltimas Not�cias </h3>
<%
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");  
    
    ArrayList<Noticia> noticias = (ArrayList<Noticia>) application.getAttribute("ultimasNoticias");
	if(noticias != null && noticias.size()>0)
    for (Noticia noticia: noticias) {
		
		out.println("<div class='center-news'><p class='newsdate' >" + dateFormat.format(noticia.getDataCadastro())+" "+ noticia.getDataCadastro().getHours()+":"+noticia.getDataCadastro().getMinutes() +"</p><p class='newstitle' >"+ noticia.getTitulo()+"</p><a class='readmore' href='FrontController?pagina=noticias&acao=exibir&idNoticia="+noticia.getIdNoticia()+"'>Leia mais</a></div> ");
	} else out.println("<div class='center-news'><p class='newstitle' >Nenhuma not�cia cadastrada!</p></div>");	
	%>		
		</div>
			  
		<div id="center-background">
			<h2> SINAL - Transportes Pontuais</h2>
			
			<table>
			<tr>
			<td style="margin-left: 20px;"><img  src="imagens/data/espera.jpg" alt="Rel�gio"  style="width: 205px; height: 308px"/></td>
			<td><p style="margin-left: 30px;">O SINAL � o servi�o que voc� estava esperando para deixar de esperar. </p>
			<p  style="margin-left: 30px;"> Isso mesmo! Chega de passar horas esperando um transporte coletivo, saia de casa quando ele estiver chegando. Saiba em tempo real quantos minutos faltam para seu �nibus passar e n�o perca mais tempo.</p></td>
			</tr>
			</table>
					
		</div>
		
		<div id="center-sectionbar">
		
		</div>
	</div>
			<jsp:include page="/rodape.html" />
