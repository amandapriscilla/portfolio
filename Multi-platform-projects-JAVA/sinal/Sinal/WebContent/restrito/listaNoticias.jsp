<%@ page import="java.util.ArrayList,infinith.sinal.modelo.Noticia,infinith.sinal.enums.Aviso"%>

<%@ page session="true" %>

<!-- Configuração Global de Pagina -->
	<jsp:include page="/header.jsp"/>

<!-- Configuração Individual da Página -->
</head>
<body>
		<jsp:include page="/cabecalho.html" />
		<!-- MIGALHA DE PÃO -->		  
         <div id="header-trackingpath"> 	  	
			  <a href="ComutadorServlet?pagina=m"><u>HOME_ADMIN</u></a>  » <a href="#"><u>NOTÍCIAS</u></a>
			</div>
		<!-- Info de Usuário Logado e Menu Lateral -->
		<jsp:include page="menu.jsp"/>

	
		<div id="center-background">	 
  	<h1>Notícias</h1>
  	  	
		<table>
		<% if(application.getAttribute("detalheNoticia") != null){
			 Noticia detalhe = (Noticia)application.getAttribute("detalheNoticia");
			 out.println("<tr><td><label> Título:</label></td><td><h3> "+ detalhe.getTitulo()+"</h3></td></tr><tr><td><label> Notícia: </label></td>");
			 out.println("<td><h3>"+detalhe.getDescricao()+"</h3></td></tr><tr><td>");
			 out.println("<label> Palavras-chave:</label></td><td><p>"+detalhe.getPalavrasChaves()+"</p></td></tr>");
		
		}
		%>
		</table>
			
			<p>&nbsp;</p>
		
		<h2 style="text-align: center">Lista de Notícias</h2>
		
		<p style="text-indent:0px"><a href="FrontControllerPrivate?p=cadNot" title="Nova Direção"><img src="imagens/button/novo.png" alt="Nova Direção"/></a></p>
		<table class="grid" align="center" cellspacing="5" cellpadding="5" >
				<caption><% 
			Aviso a = (Aviso) application.getAttribute("aviso");
			if(a != null) out.print("<div class='"+a.getTipo()+"'>"+a.getDescricao()+"</div>");
			application.removeAttribute("aviso");
		 
				
		%><caption>
		<thead>
		<tr>
			<th>Titulo</th>
			<th>Palavras-Chaves</th>
			<th>Opções</th>
		</tr>
		</thead><tbody>
		<%
			ArrayList<Noticia> noticias = (ArrayList<Noticia>) application.getAttribute("listaNoticias");
			if (noticias != null) {
				int i=0;
				for (Noticia noticia : noticias) {
					out.println("<tr"+ ((i%2==0)?(" class='odd'"):(""))+"></td>" + "<td><a href='FrontControllerPrivate?p=detalheNot&id="+ noticia.getIdNoticia()+"'>" + noticia.getTitulo()
							+ "</a></td><td>" + noticia.getPalavrasChaves() 
							+ "</td><td width='10px'><a href='FrontControllerPrivate?p=ediNot&id="
							+ noticia.getIdNoticia()+"'><img src=\"edit.png\" alt=\"Alterar este cadastro\" title=\"Alterar este cadastro\"/></a><a href='FrontControllerPrivate?p=delNot&id="
							+ noticia.getIdNoticia()+"'>&nbsp;&nbsp;<img src=\"delete.gif\" alt=\"Excluir esta notícia\" title=\"Excluir esta notícia\"/></a></td></tr>");
				}
				
			} 
		%>
		
		<tbody></table>
		</div>
		
		
		
	
	
	<div id="sidetitle">
       	<div id="titlehome">  </div>
	</div>
	</div>
	<jsp:include page="/rodape.html" />
	
	</div>
</body>
</html>