<%@ page import="infinith.sinal.modelo.Funcionario, infinith.sinal.enums.Cargo, java.lang.String"%>	
<!-- Configuração Global de Pagina -->
<jsp:include page="cabecalho.jsp"/>

<!-- Configuração Individual da Página -->
</head>
<body>
		<jsp:include page="/cabecalho.html" />
		<!-- MIGALHA DE PÃO -->		  
         <div id="header-trackingpath"> 	  	
			  <a href="ComutadorServlet?pagina=m"><u> HOME ADMIN </u></a> » <a href="#"><u>FUNCIONARIOS</u></a>
						</div>
		<!-- Info de Usuário Logado e Menu Lateral -->
		<jsp:include page="menu.jsp"/>

	
	
		<div id="center-background">			
			<h2>Editar Funcionário</h2>
			
			
		
			<form action="CrudFuncionarios" method="post">
		<% Funcionario selectedfunc = (Funcionario)request.getAttribute("selectedfunc"); %>		
		
				<table>
					<tr>
						<td>Nome</td>
			
			
		<td><input type="hidden" name="p" value="alterar"/>
		<input type="hidden" name="id" value="<%= selectedfunc.getIdFuncionario()%>"/>
			<input type="text" name="nome" value="<%= selectedfunc.getNome()%>"/>
			</td>		
					</tr>
		<!--			<tr>
				
						<td>RG</td>
				
			<td>	<input type="text" name="rg" value="<%= selectedfunc.getRg()%>"/>
						</td>
					</tr>
					<tr>
						<td>CPF</td>
						<td><input type="text" name="cpf" value="<%= selectedfunc.getCpf()%>"></input></td>
					</tr>
					<tr>
						<td>CNH</td>
						<td><input type="text" name="cnh" value="<%= selectedfunc.getCnh()%>"></input></td>
					</tr>
					<tr>-->
						<td>Cargo</td>
						<td>
						<select name="cargo">
							<option value="<%=Cargo.ADMINISTRADOR%>" <%=((selectedfunc.getCargo().equalsIgnoreCase(Cargo.ADMINISTRADOR.toString()))?("selected='SELECTED'"):"") %> ><%=Cargo.ADMINISTRADOR %></option>
							<option value="<%=Cargo.MOTORISTA%>" <%=((selectedfunc.getCargo().equalsIgnoreCase(Cargo.MOTORISTA.toString()))?("selected='SELECTED'"):"") %> ><%=Cargo.MOTORISTA %></option>
						</select>
						</td>
					</tr>
					<tr>
						<td>Login</td>
						<td><input type="text" name="login" value="<%= selectedfunc.getLogin()%>"></input></td>
					</tr>
					<tr>
						<td>Senha</td>
						<td><input type="password" name="senha" value="<%=selectedfunc.getSenha() %>" ></input></td>
					</tr>
					<tr>
						<td>Confirmar Senha</td>
						<td><input type="password" name="confirmacaoSenha" value="<%= selectedfunc.getSenha()%>"></input></td>
					</tr>
					<tr>
					<td colspan="2"> <%
						if (request.getAttribute("msgErro") != null) {
							out.println(request.getAttribute("msgErro").toString());
						}
					%></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" name="ok" value="Salvar" />
					
						</td>
					</tr>
				</table>
			</form>
			
		</div>
<p>&nbsp;</p>
	
   </div> 
		<div id="center-sectionbar" style="background-image: url(../imagens/section/home.png);">
		</div>
	</div>
			<jsp:include page="/rodape.html" />