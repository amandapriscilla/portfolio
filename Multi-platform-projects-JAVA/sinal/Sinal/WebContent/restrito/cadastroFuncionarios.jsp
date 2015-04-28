<%@ page import="infinith.sinal.modelo.Funcionario, infinith.sinal.enums.Cargo, java.lang.String, infinith.sinal.enums.Aviso"%>	
<!-- Configuração Global de Pagina -->
<jsp:include page="cabecalho.jsp"/>

<!-- Configuração Individual da Página -->
<script language="JavaScript" type="text/javascript">
//<!--use via onkeypress="SoNumeros()" no textbox
function SoNumeros()
{
var carCode = event.keyCode;
if ((carCode < 48) || (carCode > 57))
{
alert('Por favor digite apenas números.');
event.cancelBubble = true
event.returnValue = false;
}
}

function Validatevalida_cpf(theForm)

{

var strFilter = /^[0123456789]*$/;
var chkVal = theForm.Editbox2.value;
if (!strFilter.test(chkVal))
{
   alert("Digite os 11 números do CPF. Só use números !!!");
   theForm.Editbox2.focus();
   return false;
}
if (theForm.Editbox2.value == "")
{
   alert("Digite os 11 números do CPF. Só use números !!!");
   theForm.Editbox2.focus();
   return false;
}

if (theForm.Editbox2.value.length < 11)
{
   alert("Digite os 11 números do CPF. Só use números !!!");
   theForm.Editbox2.focus();
   return false;
}

if (theForm.Editbox2.value.length > 11)
{
   alert("Digite os 11 números do CPF. Só use números !!!");
   theForm.Editbox2.focus();
   return false;
}
return true;
}

//-->

</script>


</head>
<body>
		<jsp:include page="/cabecalho.html" />
		<!-- MIGALHA DE PÃO -->		  
         <div id="header-trackingpath"> 	  	
			  <a href="ComutadorServlet?pagina=m"><u> HOME ADMIN </u></a> »<a href="ComutadorServlet?p=lisfunc"><u> FUNCIONARIO </u></a>»<a href="#"><u> CADASTRO </u></a>
							</div>
		<!-- Info de Usuário Logado e Menu Lateral -->
		<jsp:include page="menu.jsp"/>

	
	
		<div id="center-background">			
			<h1>Funcionários</h1>
		<h2>Cadastro de Funcionário</h2>	

		
	<form action="CrudFuncionarios" method="post">
<% 
	Funcionario func = (Funcionario)request.getAttribute("func");	
	
%>					
				<table>
					<tr>
						<td><label>Nome</label></td><tr></tr>	
		<td><input type="hidden" name="p" value="<%=((func!=null)?"editar":"inserir") %>"/>
			<input type="text" name="nome" value="<%=((func!=null)?func.getNome():"") %>" />
			</td>		
				
	<!-- 			</tr>
					<tr>
							<td><label>RG</label></td><tr></tr>
				
			<td>	<input type="text" name="rg" value="<%=((func!=null)?func.getRg():"") %>" onkeypress="SoNumeros()"/> <em>#Somente números</em>
						</td>
					</tr>
					<tr>
						<td><label>CPF</label></td><tr></tr>
						<td><input type="text" name="cpf" value="<%=((func!=null)?func.getCpf():"") %>" onblur="Validatevalida_cpf(this)"></input><em>#Somente números</em></td>
					</tr>
					<tr>
						<td><label>CNH</label></td><tr></tr>
						<td><input type="text" name="cnh" value="<%=((func!=null)?func.getCnh():"") %>" onkeypress="SoNumeros()"></input><em>#Somente números</em></td>
					</tr> -->
					<tr>
						<td><label>Cargo</label></td><tr></tr>
						<td>
						<select name="cargo">
							<option value="<%=Cargo.ADMINISTRADOR%>" ><%=Cargo.ADMINISTRADOR %></option>
							<option value="<%=Cargo.MOTORISTA%>"><%=Cargo.MOTORISTA %></option>
						</select>
						</td>
					</tr>
					<tr>
						<td><label>Login</label></td><tr></tr>
						<td><input type="text" name="login" value="<%=((func!=null)?func.getLogin():"") %>"></input></td>
					</tr>
					<tr>
						<td><label>Senha</label></td><tr></tr>
						<td><input type="password" name="senha" ></input></td>
					</tr>
					<tr>
						<td><label>Confirmar Senha</label></td><tr></tr>
						<td><input type="password" name="confirmacaoSenha" ></input></td>
					</tr>
					<tr>
					<td> <%
						if (request.getAttribute("msgErro") != null) {
							out.println(request.getAttribute("msgErro").toString());
						}
					%></td>
					</tr>
					<tr>
						<td><input type="submit" name="ok" value="Salvar" />
				
						</td>
					</tr>
				</table>
			</form>
			
		
<p>&nbsp;</p>

<a href="javascript:history.back()">Voltar</a>
		</div>		
		<div id="center-sectionbar" style="background-image: url(imagens/section/funcionarios.png);">
		</div>
	</div>
			<jsp:include page="/rodape.html" />