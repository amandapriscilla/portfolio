<%@ page import="infinith.sinal.enums.Aviso" %>

<!-- Configuração Global de Pagina -->
	<jsp:include page="cabecalho.jsp"/>

<!-- Configuração Individual da Página -->
</head>
<body>
<!-- CABECALHO DO SINAL -->
	<jsp:include page="/cabecalho.html"/>

<!-- MIGALHA DE PÃO -->		  
		<div id="header-trackingpath">
			  <a href="ComutadorServlet?p=m"><u>HOME </u></a> » <a href="ComutadorServlet?p=listaRotas"><u> ROTAS </u></a> » <a href="#"><u> CADASTRO</u></a>
			
	</div>
		<jsp:include page="menu.jsp"/>

	
	
		<div id="center-background">
			<h1>Rotas </h1>
			<h2>Cadastro de Rota </h2>
		
			
			
					
			<form action="CrudRotas" method="post">
				
				<table>
					<caption>
			<% 
			Aviso a = (Aviso) application.getAttribute("aviso");
			if(a != null) out.print("<div class='"+a.getTipo()+"'>"+a.getDescricao()+"</div>");
			application.removeAttribute("aviso");
		%>
					</caption>
					<tr>
						<td><label>Código</label></td>
					</tr>
					<tr>
					
						<td><input type="hidden" name="p" value="inserir"/>
							<input type="text" name="nome"></input>
						</td>
					</tr>
					<tr>
					<td><label>Nome</label></td>
					</tr>
					<tr>
					
						<td><input type="text" name="descricao"></input>
						</td>
					</tr>
					<tr>
					
				<td>	<input style="background-image: url(imagens/button/salvar.png);" type="submit" name="ok" value="Salvar" title="Salvar" />
				
						</td>
					</tr>
				</table>
			</form>
				

		</div>	
		<div id="center-sectionbar" style="background-image: url(imagens/section/rotas.png);">
		</div>
	</div>
			<jsp:include page="/rodape.html" />