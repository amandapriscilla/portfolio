		<div id="header-diagonalgraybox"></div>
		<div id="header-background">	
	</div>
		
	</div>
		
	<!-- Middle -->
		
	<div id="middle">
	<div id="middle-orangebox"></div>
	<div id="middle-bannerbar">			
	<div id="painelUsuario">
				<h4>Bem vindo(a), <u><%=session.getAttribute("nome")%></u>. <a href="LogoutServlet"><img src="imagens/button/exit.png" alt="Sair do Sistema" title="Sair do Sistema"/></a></h4>
			</div>
	</div>
	</div>
	
	<!-- Center -->
	<div id="center"> 
	<div id="sidemenu">		
	<ul>		
			<a href="ComutadorServlet?p=listaRotas" title="Cadastro de Rotas e Linhas de Transportes"><li class="menu_item"><span> Rotas </span></li></a>
			<a href="ComutadorServlet?p=listaDirecao" title="Cadastro de Dire��es e Percursos"><li class="menu_item"><span> Dire��es </span></li></a>
			<a href="ComutadorServlet?p=lisgeo" title="Cadastro de Paradas e Terminais"><li class="menu_item"><span> Paradas </span></li></a>	
		<a href="ComutadorServlet?p=lisfunc" title="Cadastro de Informa��es dos Funcion�rios"><li class="menu_item"><span> Funcion�rios </span> </li></a>
		<!-- <a href="ComutadorServlet?p=lisemp" title="Cadastro de Empresas de Transporte"><li class="menu_item"> <span> Empresas </span> </li></a> -->
		<!--<a href="ComutadorServlet?p=lisveic" title="Cadastro de Ve�culos de Transporte"><li class="menu_item"><span> Ve�culos <span></li></a>-->
			<a href="FrontControllerPrivate?p=lisNot" title="Cadastro de Not�cias"><li class="menu_item"><span> Not�cias </span></li></a>
			<a href="ComutadorServlet?p=listarSacs" title="Servi�o de Atendimento ao Consumidor"><li class="menu_item"><span> SAC </span></li></a>
	</ul>	

</div>