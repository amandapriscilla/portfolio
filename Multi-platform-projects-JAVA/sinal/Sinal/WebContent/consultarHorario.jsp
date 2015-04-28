<%@ page import="java.util.ArrayList,infinith.sinal.modelo.Rota, infinith.sinal.modelo.Direcao, infinith.sinal.modelo.Georeferencia, infinith.sinal.modelo.Percurso,infinith.sinal.modelo.Noticia"%>
 <div id="timer">

<%	
String minutos = 0+"";

	ArrayList<Rota> rotas = (ArrayList<Rota>) application.getAttribute("listaRotas");
	ArrayList<Direcao> direcoes = (ArrayList<Direcao>) application.getAttribute("listaDirecoes");
	ArrayList<Percurso> percursos = (ArrayList<Percurso>) application.getAttribute("listaPercursos");
	int idRotaSelected = Integer.parseInt(application.getAttribute("idRotaSelected").toString());
	long idDirecaoSelected = Long.parseLong(application.getAttribute("idDirecaoSelected").toString());
	String idGeoreferenciaSelected = application.getAttribute("idGeoreferenciaSelected").toString();
	String pagina = application.getAttribute("pagina").toString();
	
	if (idGeoreferenciaSelected!=null && !idGeoreferenciaSelected.equalsIgnoreCase("0"))
	{
		Direcao d = null;
		
	if (direcoes != null) 
	 {
			for (Direcao direcao : direcoes) 
			if(direcao.getId() == idDirecaoSelected){ 
				d = direcao; 
				break;
			}
			
			if(application.getAttribute("minutos")!=null){ 
			minutos = application.getAttribute("minutos").toString();

			out.println("<input type='hidden' name='idrota' id='idrota' value='" + d.getRota().getId() +"' />"+
			"<input type='hidden' name='iddirecao' id='iddirecao' value='" + d.getId() +"' /><br />");
			out.println("<div id='infoMinutos'>");
			if(minutos.startsWith("-"))  out.println("<label>Serviço Indisponível</label>");
			else
				if(minutos.equals("0")) out.println("<label>CHEGANDO</label>");
			else{
				if(minutos.length()==1) minutos = "0"+minutos;
				if(minutos.length()==2){
					out.print("<img src='imagens/time/esquerda"+minutos.charAt(0)+".png' alt='"+minutos.charAt(0)+"'>");
					out.print("<img src='imagens/time/direita"+minutos.charAt(1)+".png' alt='"+minutos.charAt(1)+"'/>");	
					out.println("<p><label>MINUTOS</label></p>");
				}
				out.println("</div><div id='infoTransporte'>");
				if (percursos != null) {
					for (Percurso p: percursos) {
						if(p.getGeoreferenciaB().getId() == Long.parseLong(idGeoreferenciaSelected))
						out.println("<label id='lbgeo'> Sua Parada: "+ p.getGeoreferenciaB().getDescricao() +"</label><input type='hidden' name='idgeo' id='idgeo' value='" + 
								p.getGeoreferenciaB().getId() +"' />");
					}
								
				 
				
				out.println("<div class='displayrotas'><label id='lbrota'> Rota: "+ d.getRota().getNome()+" - " + d.getRota().getDescricao()+"</label>");
				out.println("<label id='lbdirecao'> Direção: "+ d.getDescricao()+"</label></div>");
				out.println("</div>");
				}
			}
			
			//out.println("<div id='infoTransporte'><label class='lbtimer'> Rota: "+ d.getRota().getNome()+ 
			//" - " + d.getRota().getDescricao()	+ " "
				//	+ "</label></br><label class='lbtimer'>Direção: " + d.getDescricao()+"</label></br><label> chega em:</label></div>");
			application.removeAttribute("listaRotas");
		}		
			
	application.removeAttribute("listaDirecoes");
	application.removeAttribute("listaPercursos");

	}
	
	out.println("<a style='position: absolute; left: 620px; top: 100px; vertical-align: middle;' href='FrontController?pagina=home'> <img src='imagens/button/back.png' title='Voltar'/></a>");
}	else {

// FORMULARIO!
%>
	<form action="FrontController" method="post" id="fRota">
	<label> Veja aqui o horário de seu transporte:</label>
		
	<input type="hidden" name="pagina" value="<%=pagina%>" />
	<select class="input" name="rota" title="Selecione uma rota" onchange="submit()"> <!-- subFRota() subFDirecao()-->
	<option value="0" selected="selected">ROTA</option>


<%	
if (rotas != null) {
	int i=0;
	for (Rota rota : rotas) {
		out.println("<option value='" + rota.getIdRota() +"' "+(idRotaSelected==rota.getIdRota()?"selected":"")+" >"+ rota.getNome()
				+ " - " + rota.getDescricao()+"</option>");
	}
	application.removeAttribute("listaRotas");
} else {
	out.println("Nenhuma rota cadastrada.");
}
%>
	</select>
	</form>
<form action="FrontController" method="post" id="fDirecao">
<input type="hidden" name="rota" value="<%=idRotaSelected!=0?idRotaSelected:0%>" />
<input type="hidden" name="pagina" value="<%=pagina%>" />
	<select class="input" name="direcao" onchange="submit()" <%=(idRotaSelected==0)?"disabled='disabled'":"title='Selecione uma direção' "%> >
	<option value="0" selected="selected">DIREÇÃO</option>
	<%
	if (direcoes != null) {
	int i=0;
	for (Direcao direcao : direcoes) {
		out.println("<option value='" + direcao.getIdDirecao() +"' "+(idDirecaoSelected==direcao.getIdDirecao()?"selected":"")+">"+ direcao.getDescricao()+"</option>");
	}
	application.removeAttribute("listaDirecoes");
} else {
	out.println("Nenhuma direcao cadastrada.");
}
%>
	</select>
	</form>
	
<form action="FrontController" method="post" id="fHorario">
<input type="hidden" name="rota" value="<%=idRotaSelected!=0?idRotaSelected:0%>" />
<input type="hidden" name="direcao" value="<%=idDirecaoSelected!=0?idDirecaoSelected:0%>" />
<input type="hidden" name="pagina" value="<%=pagina%>" />

<!--   TEXTO PARA ONIBUS -  -->
	<select name="georeferencia"  <%=((idRotaSelected==0)||(idDirecaoSelected==0))?"disabled='disabled'":"title='Selecione uma parada'" %> >
	<option value="0" selected>PARADA</option>
	<%


if (percursos != null) {
	int i=0;
	for (Percurso percurso : percursos) {
		out.println("<option value='" + percurso.getGeoreferenciaB().getId() +"'>"+ percurso.getGeoreferenciaB().getCodigo()+" - "+percurso.getGeoreferenciaB().getDescricao()+"</option>");
	}
	Direcao dir = (Direcao) application.getAttribute("direcaoSelected");

	application.removeAttribute("listaPercursos");
} else {
	ArrayList<Georeferencia> georeferencias = (ArrayList<Georeferencia>) application.getAttribute("listaGeoreferencias");
	if (georeferencias != null){
		int i=0;
		for (Georeferencia georeferencia : georeferencias) {
			out.println("<option value='" + georeferencia.getId() +"'>"+ georeferencia.getCodigo()+" - "+georeferencia.getDescricao()+"</option>");
		}
		Direcao dir = (Direcao) application.getAttribute("direcaoSelected");
		
		application.removeAttribute("listaGeoreferencias");
	} else {
		// TEXTO PARA ONIBUS - PARADA
		out.println("Nenhuma parada cadastrada.");
	}
}


%>
	</select>
	</br>
 
	<input type="submit" style="background-image: url(imagens/button/clock.png); widht: 150px;" id="acao" name="acao" value="Consultar Horário" title="Consultar Horário"/>
	</form>	
<% 
	}
%>	
		  
 </div>
