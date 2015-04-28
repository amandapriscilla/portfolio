<%@ page import="java.util.ArrayList, infinith.sinal.modelo.Sac,infinith.sinal.enums.Aviso"%>
<!-- Configura��o Global de Pagina -->
	<jsp:include page="/header.jsp"/>

<!-- Configura��o Individual da P�gina -->
</head>
<body>
		<jsp:include page="/cabecalho.html" />
		<!-- MIGALHA DE P�O -->		  
     
       <div id="header-trackingpath"> 	  	
			  <a href="ComutadorServlet?pagina=m"><u> HOME ADMIN </u></a> � <a href="#"><u>SAC</u></a>
			</div>
		<!-- Info de Usu�rio Logado e Menu Lateral -->
		<jsp:include page="menu.jsp"/>

		<div id="center-background">			
	

<h1>SAC</h1>

	<form action="CrudSac" name="formAssunto">
		<input type="hidden" name="p" value="assunto" />
		<select class="input" name="assuntoEscolhido" onchange="submit()" style="text-align: center;">
			<option value="0" selected="selected">Escolha o assunto</option>
			<option value="Den�ncia">Den�ncia</option>
			<option value="Reclama��o">Reclama��o</option>
			<option value="D�vida">D�vida</option>
			<option value="Melhoria">Melhoria</option>
			<option value="Elogio">Elogio</option>
		</select>
	</form>

	
			<table class="grid" align="center" cellspacing="10" cellpadding="10" frame="border">
	<!-- CODIGO PADRAO PARA FEEDBACK DE USUARIO -->		
	  <caption>
	  <% 
			Aviso a = (Aviso) application.getAttribute("aviso");
			if(a != null) out.print("<br /><div class='"+a.getTipo()+"'>"+a.getDescricao()+"</div><br />");
			application.removeAttribute("aviso");
		%></caption>
				<%
					if(application.getAttribute("lista") != null){
						ArrayList<Sac> sacs = (ArrayList<Sac>) application.getAttribute("lista");
						if (sacs.size() > 0) {
							out.print("<thead><tr>"
									+ "<th>Nome do Solicitante</th>"
									+ "<th>E-Mail</th>"
									+ "<th>Assunto</th>"
									+ "<th>Op��es</th>"
									+ "</tr></thead>");
							int i=0;
							for (Sac sac : sacs) {
								out.print("<tr"+((i%2==0)?" class='odd'":"")+">"
										+ "<td>" + sac.getNome() + "</td>"
										+ "<td>" + sac.getEmail() + "</td>"
										+ "<td>" + sac.getAssunto() + "</td>"
										+ "<td><a href=\"CrudSac?p=abrirMsg&r=" + sac.getIdSac() + "\">");
								
								if(sac.getLido()==0){
									out.print("<img src=\"msg_nova.png\" alt=\"Nova mensagem.\" title=\"Nova mensagem\"/>");
								}else{
									out.print("<img src=\"msg_lida.png\" alt=\"Abrir mensagem.\" title=\"Abrir mensagem\"/>");
								}
								out.print("</a></td>");
								i++;
							}
							out.print("</tr></table>");
							application.removeAttribute("lista");
						} else {
							out.println("</table><br/>Sem solicita��es para este assunto.");
						}
						
					}
				out.println("</table>");
				%>
			

		
   </div> 
		<div id="center-sectionbar" style="background-image: url(../imagens/section/home.png);">
		</div>
	</div>
			<jsp:include page="/rodape.html" />