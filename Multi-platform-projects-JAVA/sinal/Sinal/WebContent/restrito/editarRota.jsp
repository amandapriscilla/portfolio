<%@ page import="infinith.sinal.modelo.Rota,java.lang.String, infinith.sinal.enums.Aviso"%>

<%@ page session="true"%>
<!-- Configura��o Global de Pagina -->
	<jsp:include page="cabecalho.jsp"/>

<!-- Configura��o Individual da P�gina -->
</head>
<body>
<!-- CABECALHO DO SINAL -->
	<jsp:include page="/cabecalho.html"/>

<!-- MIGALHA DE P�O -->		  
		<div id="header-trackingpath">	
		<% Rota r = (Rota)application.getAttribute("rota"); %>
	
		<a href="ComutadorServlet?p=m"><u>HOME </u></a> � <a href="ComutadorServlet?p=listaRotas"><u> ROTAS </u></a> � <a href="#"><u>EDI��O</u></a>
			
	</div>
		<jsp:include page="menu.jsp"/>

	
		<div id="center-background">
			<h1>Rotas </h1>
			<h2>Edi��o de Rota </h2>

		<div id="formCadastroRota">
		<form action="CrudRotas" method="post">
				<input type="hidden" name="p" value="alterar" /> 
				<table>
				<caption>
					<!-- CODIGO PADRAO PARA FEEDBACK DE USUARIO -->
	  <% 
			Aviso a = (Aviso) application.getAttribute("aviso");
			if(a != null) out.print("<div class='"+a.getTipo()+"'>"+a.getDescricao()+"</div>");
			application.removeAttribute("aviso");
		%>
				
				</caption>
					<tr>
						<th><label>C�digo</th><label></tr><tr>
						<td><input type="text" name="nome" value="<%= r.getNome() %>"/></td>
					</tr><tr>
						<th><label>Nome</th><label></tr><tr>
						<td><input type="text" name="descricao" value="<%= r.getDescricao() %>"/></td>
					</tr><tr>
					<td><input type="hidden" name="id" value="<%=r.getId() %>"/>
						
						
						
						<input style="background-image: url(imagens/button/salvar.png);" type="submit" name="ok" value="Salvar" title="Salvar" />
						</td>
					</tr>
				</table>
			</form>
		
		</div>



		</div>	
		<div id="center-sectionbar" style="background-image: url(imagens/section/rotas.png);">
		</div>
	</div>
			<jsp:include page="/rodape.html" />