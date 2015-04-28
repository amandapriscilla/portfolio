<%@ page session="true" %>
<!-- Configuração Global de Pagina -->
	<jsp:include page="cabecalho.jsp"/>

<!-- Configuração Individual da Página -->
</head>
<body>
<!-- CABECALHO DO SINAL -->
	<jsp:include page="/cabecalho.html"/>

<!-- MIGALHA DE PÃO -->		  
		<div id="header-trackingpath">
			  <a href="FrontController?pagina=home">HOME_ADMIN </u></a> » <a href="ComutadorServlet?pagina=listaGeo"><u> PARADAS </u></a> » <a href="#"><u> CADASTRO</u></a>
				</div>
		<!-- Info de Usuário Logado e Menu Lateral -->
		<jsp:include page="menu.jsp"/>
	
		<div id="center-background">			
			<h1>Paradas</h1>
			<h2>Cadastro de Parada</h2>
			
			<form action="CrudGeoreferencias" method="post">
			<input type="hidden" name="p" value="inserir">
				<table>
				
					<tr>
						<td><label>Código</label></td></tr><tr>
						<td><input type="text" name="codigo"></input></td>
					</tr>
					<tr>
						<td><label>Descrição</label></td></tr><tr>
						<td><input type="text" name="descricao"></input></td>
					</tr>
					<tr>
						<td><label>Latitude</label></td></tr><tr>
						<td><input type="text" name="latitude"></input></td>
					</tr>
					<tr>
						<td><label>Longitude</label></td></tr><tr>
						<td><input type="text" name="longitude"></input></td>
					</tr>
					<tr>
					<td><label>Importante: </label>
						&nbsp;&nbsp;<input type="checkbox" name="importancia"></input></td>
					</tr>
					<tr>
						
						<td><input style="background-image: url(imagens/button/salvar.png);" type="submit" name="ok" value="Salvar" title="Salvar" />
						</td>
					</tr>
				</table>
			</form>
		

		</div>	
		<div id="center-sectionbar" style="background-image: url(../imagens/section/noticias.png);">
		</div>
	</div>
			<jsp:include page="/rodape.html" />