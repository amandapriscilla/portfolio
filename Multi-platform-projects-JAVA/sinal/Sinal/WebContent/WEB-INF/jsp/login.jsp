<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="sinal.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SINAL - Login</title>
</head>
<body>
	<div id="main">
		<jsp:include page="/cabecalho.html" />
		<%
				if (request.getAttribute("msgLogout") != null) {
					out.println(request.getAttribute("msgLogout").toString());
					request.removeAttribute("msgLogout");
				}
			%>
		<div id="formLogin">
			<%
				if (request.getAttribute("msgErroLogin") != null) {
					out.println(request.getAttribute("msgErroLogin").toString());
				}
			%>
			<table>
				<form action="LoginServlet" method="post">
					<tr>
						<td>Login</td>
						<td><input type="text" name="login" width="50" /></td>
					</tr>
					<tr>
						<td>Senha</td>
						<td><input type="password" name="senha" /></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="OK" id="btLogin"
							align="right" /></td>
					</tr>
				</form>
			</table>
		</div>
		<div id="rodape"><jsp:include page="/WEB-INF/html/rodape.html" /></div>
	</div>
</body>
</html>