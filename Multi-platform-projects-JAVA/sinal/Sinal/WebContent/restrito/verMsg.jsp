<%@ page import="java.util.ArrayList,infinith.sinal.modelo.Sac"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function voltar(){
	window.navigate("http://www.google.com");
}
</script>
<jsp:include page="/restrito/cabecalho.jsp" />
</head>
<body>
	
	<!-- CABECALHO DO SINAL -->
	<jsp:include page="/cabecalho.html"/>
	<p class="trackingpath">	
			  <a href="#"><u>HOME </u></a> » <a href="#"><u> SAC</u></a>
			</p>
		<!-- Info de Usuário Logado e Menu Lateral -->
	
	 <jsp:include page="menu.jsp"/>
	<div id="content">
	<div id="illustration"></div>  
		<div id="tabelaEmpresas">
		<h2 style="text-align: center">Mensagem</h2>
	
		<%
			Sac sac = (Sac) application.getAttribute("msg");
		%>
		
		<label>Solicitante: <%= sac.getNome() %></label><p/>
		<label>E-mail: <%= sac.getEmail() %></label><p/>
		<label>Mensagem: <p><%= sac.getMensagem() %></p></label><p></p>
		<button onclick="voltar();">Cancelar</button>
		
		
</div>
<p>&nbsp;</p>
</div>
	<div id="sidetitle">
       	<div id="titlehome">  </div>
	</div>
<!-- RODAPE DO SINAL -->
	<jsp:include page="/rodape.html"/>
</body>
</html>