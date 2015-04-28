<%@ page import="infinith.sinal.modelo.Noticia,infinith.sinal.enums.Aviso "%>
<%@ page session="true" %>

<!-- Configuração Global de Pagina -->
<jsp:include page="cabecalho.jsp"/>

<!-- Configuração Individual da Página -->
</head>
<body>
		<jsp:include page="/cabecalho.html" />
		<!-- MIGALHA DE PÃO -->		  
         <div id="header-trackingpath"> 	 
<% Noticia n = (Noticia) application.getAttribute("noticia");%>

		<a href="ComutadorServlet?pagina=m"><u> HOME ADMIN </u></a> » <a href="javascrit:history.back()"><u>NOTÍCIAS</u></a> » <a href="#"><u><%=(n!=null)?("EDIÇÃo"):("CADASTRO")%></u></a>         
     
			</div>
		<!-- Info de Usuário Logado e Menu Lateral -->
		<jsp:include page="menu.jsp"/>	
		<div id="center-background">			
<h1> Notícias </h1>

<h2><%=(n!=null)?("Editar"):("Cadastrar")%> Noticia</h2>
			
			<form action="FrontControllerPrivate" method="post">
			<input type="hidden" name="p" value="<%=(n!=null)?("ediNotFinal"):("cadNotFinal")%>"/>
			<input type="hidden" name="dataCadastro" value="<%=(n!=null)?(n.getDataCadastro()):("")%>"/>
			<input type="hidden" name="idNoticia" value="<%=(n!=null)?(n.getId()):("")%>"/>
				<table>
						<caption><% 
			Aviso a = (Aviso) application.getAttribute("aviso");
			if(a != null) out.print("<div class='"+a.getTipo()+"'>"+a.getDescricao()+"</div>");
			application.removeAttribute("aviso");
				
		%><caption>
				
					<tr>
						<td><label>Titulo</label></td></tr><tr>
						<td><input type="text" name="titulo" value="<%=(n!=null)?(n.getTitulo()):("")%>"></input></td>
					</tr>
					<tr>
						<td><label>Descricao</label></td></tr><tr>
						<td>
						<textarea name="descricao" rows="5"  cols="30"><%=(n!=null)?(n.getDescricao()):("")%></textarea>
						</td>
					</tr>
					<tr>
						<td> <label>Palavras-Chaves</label></td></tr><tr>
						<td><input type="text" name="palavrasChaves" value="<%=(n!=null)?(n.getPalavrasChaves()):("")%>"></input></td>
					</tr>
					<tr>
						<td></td>
						<td><input style="background-image: url(imagens/button/salvar.png);" type="submit" name="ok" value="Salvar" title="Salvar" />
						</td>
					</tr>
				</table>
			</form>

		</form>

<p>&nbsp;</p>

		</div>	
		<div id="center-sectionbar" style="background-image: url(imagens/section/noticias.png);">
		</div>
	</div>
			<jsp:include page="/rodape.html" />