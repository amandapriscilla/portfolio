<%@ page import="infinith.sinal.enums.Aviso" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/restrito/cabecalho.jsp" />
<script language="JavaScript" type="text/javascript">

<!--

function Validatevalida_cnpj(theForm)

{

var strFilter = /^[0123456789]*$/;

var chkVal = theForm.Editbox1.value;

if (!strFilter.test(chkVal))

{

   alert("Digite os 14 números do CNPJ. Só use números !!!");

   theForm.Editbox1.focus();

   return false;

}

if (theForm.Editbox1.value == "")

{

   alert("Digite os 14 números do CNPJ. Só use números !!!");

   theForm.Editbox1.focus();

   return false;

}

if (theForm.Editbox1.value.length < 14)

{

   alert("Digite os 14 números do CNPJ. Só use números !!!");

   theForm.Editbox1.focus();

   return false;

}

if (theForm.Editbox1.value.length > 14)

{

   alert("Digite os 14 números do CNPJ. Só use números !!!");

   theForm.Editbox1.focus();

   return false;

}

return true;

}

//-->
</script>
</head>
<body>
		<jsp:include page="/cabecalho.html" />
		<div id="painelUsuario">
		Bem vindo, <%= session.getAttribute("nome") %>.
		<a href="LogoutServlet">sair</a>
		</div>
		<jsp:include page="menu.jsp"/>

<div id="content">
<h2>Cadastrar Empresa</h2>
		<% 
			Aviso a = (Aviso) application.getAttribute("aviso");
			if(a != null) out.print("<div class='"+a.getTipo()+"'>"+a.getDescricao()+"</div>");
			application.removeAttribute("aviso");
		%>
<div id="formCadastroEmpresa" >
			
			
			<form action="CrudEmpresas" method="post">
			<input type="hidden" name="p" value="inserir">
				<table>
					<tr>
						<td>Fantasia</td>
						<td><input type="text" name="fantasia"></input></td>
					</tr>
					<tr>
						<td>Razão Social</td>
						<td><input type="text" name="razao"></input></td>
					</tr>
					<tr>
						<td>CNPJ</td>
						<td><input type="text" name="cnpj"></input></td>
					</tr>
					<tr>
						<td>Insc. Municipal</td>
						<td><input type="text" name="inscMun"></input></td>
					</tr>
					<tr>
						<td>Insc. Estadual</td>
						<td><input type="text" name="inscEst"></input></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" name="ok" value="Cadastrar" />
						</td>
					</tr>
				</table>
			</form>
</div>
<p>&nbsp;</p>
</div>

		<a href="ComutadorServlet?p=lisemp">Listar Empresas</a>
		<div id="sidetitle">
       		<div id="titlehome">  </div>
		</div>
	</div>
	<jsp:include page="/rodape.html" />
	
	</div>

</body>
</html>