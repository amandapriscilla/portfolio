<%@ page import="java.text.ParseException, java.text.SimpleDateFormat, java.util.Date"%>
<%@ page import="java.util.ArrayList,infinith.sinal.modelo.Noticia"%>	
<%@ page import="infinith.sinal.enums.Aviso"%>

<!-- Configuração Global de Pagina -->
	<jsp:include page="/header.jsp"/>

<!-- Configuração Individual da Página -->
<style type="text/css">
#center input.botao {
	background: #E7E7E7 url(images/btn_enviar.png) no-repeat right;
	font-size: 0em;
	width: 120px;
	height: 25px;
	text-align: right;
}

</style>

<script type="text/javascript">
//<!--
function validateForm(form)
{
var x= form["email"].value;
var msg = form["mensagem"].value;
var nome = form["nome"].value;
var atpos=x.indexOf("@");
var dotpos=x.lastIndexOf(".");

if ((atpos < 1) || (dotpos < (atpos + 2)) || ((dotpos + 2) >= x.length))
  {
  alert("Email Incorreto, sua mensagem não foi enviada. Verifique seu email e tente novamente.");
  return false;
  }

if(msg.length() > 250)
{
	alert("A mensagem deve ser menor que 250 caracteres.");
	return false;
}
alert("Mensagem enviada!");
return true;
}
//-->
</script>

</head>
<body>
<!-- CABECALHO DO SINAL -->
	<jsp:include page="/cabecalho.html"/>

<!-- MIGALHA DE PÃO -->		  
		<div id="header-trackingpath">
			<a href="FrontController?pagina=home">HOME</a> » <a href="#">CONTATO</a>
		</div>
		<div id="header-diagonalgraybox"></div>
		<div id="header-background">
		
	  <!-- FORM CONSULTAR HORARIO E TEMPO DE ESPERA-->
		<jsp:include page="/consultarHorario.jsp"/>
		
		</div>
	</div>
		
	<!-- Middle -->
		
	<div id="middle">
	<div id="middle-orangebox"></div>
	<div id="middle-bannerbar"></div>
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
		<h1>Contato</h1>
		<p>Contate-nos, queremos saber sua opinião! </p>
	
			
		<form id="formcontato" action="CrudSac" method="post" onsubmit="return validateForm(this)">
			<input type="hidden" name="p" value="inserir" />
			
				<table>
					<caption> 	
					<!-- CODIGO PADRAO PARA FEEDBACK DE USUARIO -->		
	  <% 
			Aviso a = (Aviso) application.getAttribute("aviso");
			if(a != null) out.print("<br /><div class='"+a.getTipo()+"'>"+a.getDescricao()+"</div><br />");
			application.removeAttribute("aviso");
		%></caption>
		<% String nome = (String) application.getAttribute("nome");
			if(nome == null) nome = "";
			String mensagem = (String) application.getAttribute("mensagem");
			if(mensagem == null) mensagem = "";
			String email = (String) application.getAttribute("email");
			if(email == null) email = "";
			String assunto = (String) application.getAttribute("assunto");
			if(assunto == null) assunto = "0";
			%>
					<tr>
						<td><label>Nome</label></td>
						<tr></tr>
						<td><input type="text" name="nome" value="<%=nome%>"/></td>
					</tr>
					<tr>
						<td><label>E-mail</label></td>
						<tr></tr>
						<td><input type="text" id="email" name="email" value="<%=email%>" /></td>
					</tr>
					<tr>
						<td>
							<label>Assunto</label>
						</td>
						<tr></tr>
						<td>
						
						<select name="assunto">
								<option value="0" <%=(assunto.equals("0"))?"selected":"" %>>-- Selecione um Assunto --</option>
								<option value="DENÚNCIA" <%=(assunto.equalsIgnoreCase("DENÚNCIA"))?"selected":""%>>DENÚNCIA</option>
								<option value="RECLAMAÇÃO" <%=(assunto.equalsIgnoreCase("RECLAMAÇÃO"))?"selected":""%>>RECLAMAÇÃO</option>
								<option value="DÚVIDA" <%=(assunto.equalsIgnoreCase("DÚVIDA"))?"selected":""%>>DÚVIDA</option>
								<option value="SUGESTÃO" <%=(assunto.equalsIgnoreCase("SUGESTÃO"))?"selected":""%>>SUGESTÃO</option>
								<option value="ElOGIO" <%=(assunto.equalsIgnoreCase("ElOGIO"))?"selected":""%>>ELOGIO</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<label>Mensagem</label>
						</td>
						<tr></tr>
						<td>
							<textarea name="mensagem" cols="30" rows="5"><%=mensagem%></textarea>
							<input type="hidden" name="pagina" value="contato"/>
						</td>
					</tr>
					<tr>
			<td> <%
				if (request.getAttribute("msgErroLogin") != null) {
					out.println(request.getAttribute("msgErroLogin").toString());
				}
			%></td>
			</tr>
					<tr>
					
						<td ><input class="botao" title="Enviar dados" type="submit" value="Contato" id="acao"/></td>
					</tr>
					</table>
				</form>
			
		
		</div>
		
		
		<div id="center-sectionbar" style="background-image: url(imagens/section/home.png);">
		</div>
	</div>
			<jsp:include page="/rodape.html" />
