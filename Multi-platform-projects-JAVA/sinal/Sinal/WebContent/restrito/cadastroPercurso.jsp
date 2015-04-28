<%@ page session="true"%>
<%@ page import="java.util.ArrayList,infinith.sinal.modelo.Rota, infinith.sinal.modelo.Direcao, infinith.sinal.enums.Aviso, infinith.sinal.modelo.Georeferencia, infinith.sinal.modelo.Percurso, java.util.List, java.lang.Long"%>
<!-- Configuração Global de Pagina -->
	<jsp:include page="cabecalho.jsp"/>

<!-- Configuração Individual da Página -->
<script type="text/javascript">
//<!--use via onkeypress="SoNumeros()" no textbox
function SoNumeros(){    
    if (document.all) // Internet Explorer  
            var tecla = event.keyCode;  
    else if(document.layers) // Nestcape  
            var tecla = e.which;  
  
    if ((tecla > 47 && tecla < 58)) // numeros de 0 a 9  
        return true;  
    else {  
        if (tecla != 8) // backspace  
            //event.keyCode = 0;  
            return false;  
        else  
            return true;  
    }  
}  


</script>

</head>
<body>
<!-- CABECALHO DO SINAL -->
	<jsp:include page="/cabecalho.html"/>

<!-- MIGALHA DE PÃO -->		  
		<div id="header-trackingpath">
			  <a href="FrontController?pagina=home">HOME_ADMIN </u></a> » <a href="ComutadorServlet?pagina=listaDirecao"><u> DIREÇÃO </u></a> » 
		» <a href="history.back()"><u> PERCURSO</u></a> » <a href="#"><u> CADASTRO</u></a>
	</div>
		<!-- Info de Usuário Logado e Menu Lateral -->
		<jsp:include page="menu.jsp"/>
	
		<div id="center-background">			

		<h1>Direção</h1>
<h2>Cadastro de Percurso da Direção</h2>	
	
		<form action="CrudDirecoes" method="post">
			<table>
			
		<!-- CODIGO PADRAO PARA FEEDBACK DE USUARIO -->
<caption>	  <% 
			Aviso a = (Aviso) application.getAttribute("aviso");
			if(a != null) out.print("<div class='"+a.getTipo()+"'>"+a.getDescricao()+"</div>");
			application.removeAttribute("aviso");
		%>			
	</caption>
				<tr>
					<td><label>Rota</label></td></tr><tr>
					<td>
						<% Direcao direcao = (Direcao) application.getAttribute("direcao");
							 out.print(direcao.getRota().getNome()+" - "+ direcao.getRota().getDescricao());
							 %>
					</td>
				</tr>
				<tr>
					<td><label>Direção</label></td></tr><tr>
					<td>
						<% out.print(direcao.getDescricao());%> </td>
				</tr>
				<tr>
					<td>
						<%
				List<Georeferencia> georeferencias = (List<Georeferencia>) application.getAttribute("listaGeoreferencias");
				List<Percurso> percursos = (List<Percurso>) application.getAttribute("listaPercursos");
				if(percursos != null && percursos.size()>0){
					out.println("<table><tr><th>Parte da Parada:</th> <th>Chega a Parada:</th><th>Tempo</th><th>Distância</th><tr>"); 	
					for(Percurso p: percursos)
					out.println("<tr><td>"+ p.getGeoreferenciaA().getDescricao()+"</td><td>"+ p.getGeoreferenciaB().getDescricao()+" min.</td><td>"+ p.getTempo()+"metros </td></tr>");		 		
												
		%>
					</td>
				</tr>
			</table>
			<%} %>
			<td><h1>Novo Percurso</h1></td></tr><tr>
			<td><% long idGeoA = Long.parseLong(application.getAttribute("idGeoSelected").toString()); %></td>
			</tr><tr>
				<td><label>Parada A</label></td></tr><tr>
				<td>
					<form name="getGeoA" action="CrudDirecoes" method="post">
					<input type="hidden" name="p" value="getGeo" /> 
					<input type="hidden" name="iddirecao" value="<%=direcao.getId() %>" />
						<select class="input" name="georeferenciaA" onchange="submit()">
							<option value="0" selected="selected">PARADA</option>
							<% 	String checado = "";
						
					ArrayList<Georeferencia> paradasLivres = (ArrayList<Georeferencia>) application.getAttribute("listaGeoreferencias");
					
					if (georeferencias != null && georeferencias.size() > 0){
						for (Georeferencia geo : paradasLivres)	
						{
							out.print("<option value='"+geo.getId() +"' "+(idGeoA==geo.getId()?"selected=\"selected\"":"")+">"+geo.getCodigo()+" - "+geo.getDescricao() +"</option>");
						}
						
					}					
				%>
						</select>
					
					
					</form>
				<form name="salvaPercurso"  action="CrudDirecoes" method="post"></td>
			</tr>
			<tr>
				<td><label>Parada B</label></td></tr><tr>
				<td>
					<input type="hidden" value="<%= idGeoA!=0?idGeoA:0%>" name="georeferenciaA"/>
				<select class="input" name="georeferenciaB"	<%=((idGeoA==0)?"disabled='disabled'":"title='Selecione uma parada'") %>>
						<option value="0" selected> PARADA</option> 
						
				<% 
				
				  	if (georeferencias.size() > 1){
						for (Georeferencia geo : paradasLivres)	
						{
							if(geo.getId()!=idGeoA && idGeoA != 0)
								out.print("<option value='"+geo.getId() +"'>"+geo.getCodigo()+" - "+geo.getDescricao() +"</option>");
						}
						
					}					
					%></select>	
			</td>
			</tr>
			<tr>
		
				<td><input style="background-image: url(imagens/button/salvar.png);" type="submit" name="ok" value="Salvar" title="Salvar" />
				</td>
			</tr>
			<table></table>
</form>
		</div>	
		<div id="center-sectionbar" style="background-image: url(../imagens/section/noticias.png);">
		</div>
	</div>
			<jsp:include page="/rodape.html" />