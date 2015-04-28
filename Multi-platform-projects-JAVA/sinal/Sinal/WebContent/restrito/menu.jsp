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
			<a href="ComutadorServlet?p=listaDirecao" title="Cadastro de Direções e Percursos"><li class="menu_item"><span> Direções </span></li></a>
			<a href="ComutadorServlet?p=lisgeo" title="Cadastro de Paradas e Terminais"><li class="menu_item"><span> Paradas </span></li></a>	
		<a href="ComutadorServlet?p=lisfunc" title="Cadastro de Informações dos Funcionários"><li class="menu_item"><span> Funcionários </span> </li></a>
		<!-- <a href="ComutadorServlet?p=lisemp" title="Cadastro de Empresas de Transporte"><li class="menu_item"> <span> Empresas </span> </li></a> -->
		<!--<a href="ComutadorServlet?p=lisveic" title="Cadastro de Veículos de Transporte"><li class="menu_item"><span> Veículos <span></li></a>-->
			<a href="FrontControllerPrivate?p=lisNot" title="Cadastro de Notícias"><li class="menu_item"><span> Notícias </span></li></a>
			<a href="ComutadorServlet?p=listarSacs" title="Serviço de Atendimento ao Consumidor"><li class="menu_item"><span> SAC </span></li></a>
	</ul>	

</div>