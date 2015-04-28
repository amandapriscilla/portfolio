<%@ page import="java.util.ArrayList, infinith.sinal.modelo.Funcionario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="estilo.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SINAL - Funcionarios Cadastrados</title>
</head>
<body>
<div id="main">
		<jsp:include page="/cabecalho.html" />
		<div id="painelUsuario">
		Bem vindo, <%= session.getAttribute("nome") %>.
		<a href="LogoutServlet">sair</a></div>
		
		
		
<div id="tabelaFuncionarios">
<h2 style="text-align: center">Funcionarios Cadastradas</h2>
			<table align="center" cellspacing="5" cellpadding="5" frame="border">
				<tr>
					<th>N.</th>
					<th>Nome</th>
					<th>RG</th>
					<th>CPF</th>
					<th>CNH</th>
					<th>Cargo</th>
					<th>Opções</th>
				</tr>
				<%
					ArrayList<Funcionario> funcionarios = (ArrayList<Funcionario>) application.getAttribute("lista");
					if (funcionarios.size() > 0) {
						int i=0;
						for (Funcionario funcionario : funcionarios) {
							out.println("<tr><td>" + ++i +"</td><td>"+ funcionario.getNome()
									+ "</td>" + "<td>" + funcionario.getRg()
									+ "</td>" + "<td>" + funcionario.getCpf() + "</td>"
									+ "<td>" + funcionario.getCnh() + "</td>"
									+ "<td>" + funcionario.getCargo() + "</td>"
									+ "<td><a href=\"CrudFuncionarios?p=excluir&r=" + funcionario.getIdFuncionario()
									+ "\"><img src=\"delete.gif\" alt=\"Excluir esta funcionario\" title=\"Excluir esta funcionario\"/></a> <a href=\"CrudFuncionarios?p=editar&r=" + funcionario.getIdFuncionario()+"\"><img src=\"edit.png\"/></a></td>");
						}
						application.removeAttribute("lista");
					} else {
						out.println("Nenhum funcionario cadastrado.");
					}
				%>
			</table>
		</div>
		
		<a href="ComutadorServlet?p=m">Voltar</a>
		
		<div id="rodape"><jsp:include page="/WEB-INF/html/rodape.html" /></div>
	</div>
</body>
</html>