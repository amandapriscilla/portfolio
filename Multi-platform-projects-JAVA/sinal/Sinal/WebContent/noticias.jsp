<%@ page import="java.util.ArrayList,infinith.sinal.modelo.Rota, infinith.sinal.modelo.Direcao, infinith.sinal.modelo.Georeferencia, infinith.sinal.modelo.Percurso,infinith.sinal.modelo.Noticia"%>
<%@ page import="java.text.ParseException, java.text.SimpleDateFormat, java.util.Date"%>

<!-- Configuração Global de Pagina -->
	<jsp:include page="header.jsp"/>

<!-- Configuração Individual da Página -->


<script type="text/javascript">

function subFRota(){
	document.getElementById("fRota").submit();
} 

function subFDirecao(){
	document.getElementById("fDirecao").submit();
}

function subFHorario(){
	document.getElementById("fHorario").submit();
}
</script>

</head>


<body>
<!-- CABECALHO DO SINAL -->
	<jsp:include page="cabecalho.html"/>

<!-- MIGALHA DE PÃO -->		  
          	  
			<p class="trackingpath">	
			  <a href="FrontController?pagina=home"><u>HOME</u></a> » <a href="FrontController?pagina=noticias&acao=listarNoticias"><u>NOTICIAS</u></a>
			</p>
		 </div>
        </div>
	</div><!-- Fim do topheader-->
	
  <!-- FORM CONSULTAR HORARIO E TEMPO DE ESPERA-->

		<jsp:include page="consultarHorario.jsp"/>
	
	<div id="separator">
        <div id="orangebar"> </div>
        <div id="whitebar"></div>
      </div>
  </div>  <!-- Fim do header -->
      
    <div id="center"> 
    	
		<div id="widecontent">
		
			<div id="text">
	
			<%

	String acao = (String)application.getAttribute("acao");

	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); 

	if (acao.equalsIgnoreCase("exibirNoticia")){
		Noticia noticia = (Noticia)application.getAttribute("noticia");
		out.println("<h1>"+ noticia.getTitulo()+"</h1>");
		out.println("<h3>"+ noticia.getDescricao()+"</h3>");
		out.println("<h4> Data cadastro: " + dateFormat.format(noticia.getDataCadastro())+" "+ noticia.getDataCadastro().getHours()+":"+noticia.getDataCadastro().getMinutes() +"</h4> ");
	} else {
		if (acao.equalsIgnoreCase("listarNoticias")){
		    ArrayList<Noticia> noticias = (ArrayList<Noticia>) application.getAttribute("noticias");
		    out.println("<table> <tr><td colspan='3'><h3>Todas as Notícias</h3></td></tr>");
		    out.println("<table> <tr><td>Data Cadastro</td><td>Título</td><td></td></tr>");
		    for (Noticia noticia : noticias) {
				out.println("<tr><td>"+dateFormat.format(noticia.getDataCadastro())+" "+ noticia.getDataCadastro().getHours()+":"+noticia.getDataCadastro().getMinutes() +"</td><td>"+ noticia.getTitulo()+"</td><td><a class='leiamais' href='FrontController?pagina=noticias&idNoticia="+noticia.getIdNoticia()+"'>Leia mais</a></td></tr> ");
			}
		    out.println("</table>");
		}
	}
    

%>	
			</div>
			<p>&nbsp;</p>
		</div>
		<div id="sidetitle">
        	<div id="titlehome">  </div>
		</div>
   
   </div>
<!-- RODAPE DO SINAL -->
	<jsp:include page="rodape.html"/>
	</div>
</body>
</html>