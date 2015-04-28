<%@ page import="infinith.sinal.modelo.Rota, infinith.sinal.modelo.Direcao, infinith.sinal.modelo.Georeferencia, infinith.sinal.modelo.Percurso"%>
<%@ page import="java.util.ArrayList,java.text.ParseException, java.text.SimpleDateFormat, java.util.Date,infinith.sinal.modelo.Noticia"%>

<!-- Configura��o Global de Pagina -->
	<jsp:include page="header.jsp"/>

<!-- Configura��o Individual da P�gina -->

</head>
<body>
<!-- CABECALHO DO SINAL -->
	<jsp:include page="cabecalho.html"/>

<!-- MIGALHA DE P�O -->		  
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
			<h2> Cansado de perder o �nibus e chegar atrasado?</h2>
			
			<table>
			<tr>
			<td style="margin-left: 20px;"><img  src="imagens/data/relogio.PNG" alt="Rel�gio"  style="width: 108px; height: 133px"/></td>
			<td><p style="margin-left: 30px;">O <b>Sistema de Notifica��es Autom�ticas de Localiza��o (SINAL)</b> � um conceito novo em tecnologia que fornece � popula��o em geral um servi�o de consulta a hor�rios em tempo real de transportes p�blicos em circula��o na cidade de Natal e Grande Natal.</p></td>
			</tr>
			</table>
					
		</div>
		
		<div id="center-sectionbar">
		
		</div>
	</div>
			<jsp:include page="rodape.html" />
