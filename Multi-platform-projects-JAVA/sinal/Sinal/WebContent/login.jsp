<%@ page import="java.util.ArrayList,java.text.ParseException, java.text.SimpleDateFormat, java.util.Date,infinith.sinal.modelo.Noticia"%>
<%@ page import="infinith.sinal.enums.Aviso"%>
	
<!-- Configuração Global de Pagina -->
	<jsp:include page="header.jsp"/>
<!-- Configuração Individual da Página -->
<style type="text/css">

#center #btLogin.botao {
	background: #E7E7E7 url(images/btn_entrar.png) no-repeat;
	font-size: 0em;
	width: 120px;
	height: 25px;
	text-align: right;
}
</style>

</head>
<body>

<!-- CABECALHO DO SINAL -->

	<jsp:include page="cabecalho.html"/>

<!-- MIGALHA DE PÃO -->		  
		<div id="header-trackingpath">
			  <a href="FrontController?pagina=home"><u>HOME</u></a> » <a href="#"><u>LOGIN</u></a>
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
		<div id="middle-bannerbar">	
		 </div>
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
			<h1>Área Restrita </h1>
			<form action="LoginServlet" method="post">
	
			<table>
		<caption> 	
<!-- CODIGO PADRAO PARA FEEDBACK DE USUARIO -->		
	  <% 
			Aviso a = (Aviso) application.getAttribute("aviso");
			if(a != null) out.print("<br /><div class='"+a.getTipo()+"'>"+a.getDescricao()+"</div><br />");
			application.removeAttribute("aviso");
		%></caption>
					
					
					<tr>
						<td><label>Login</label></td>
						<tr></tr>
						<td><input class="login" type="text" name="login" width="50" /></td>
					</tr>
					<tr>
						<td><label>Senha</label></td>
						<tr></tr>
						<td><input class="login" type="password" name="senha" /></td>
					</tr><tr>
					<td>
							<%
			if (request.getAttribute("msgLogout") != null) {
					out.println(request.getAttribute("msgLogout").toString());
					request.removeAttribute("msgLogout");
				}
			%></td>
				</tr><tr>	
					
						<td><input class="botao" title="Entrar como administrador" type="submit" value="Entrar" id="btLogin"
							align="right" /></td>
					</tr>

				</table>
			</form>
		</div>

		<div id="center-sectionbar" style="background-image: url(../imagens/section/home.png);">
		
		</div>
	</div>
			<jsp:include page="rodape.html" />
